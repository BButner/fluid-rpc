use std::{net::ToSocketAddrs, pin::Pin, time::Duration};

use chrono::Local;
use proto::{
    bar_service_server::BarService, BarRequest, BarStreamIntervalRequest, BarStreamRequest,
    BarStreamResponse, FooRequest, FooStreamIntervalRequest, FooStreamRequest, FooStreamResponse,
};
use tokio::sync::mpsc;
use tokio_stream::{wrappers::ReceiverStream, Stream, StreamExt};
use tonic::{transport::Server, Request, Response, Status};

use self::proto::foo_service_server::FooService;

pub mod proto {
    tonic::include_proto!("com.bbutner.frpc.testserver");

    pub(crate) const FILE_DESCRIPTOR_SET: &[u8] = tonic::include_file_descriptor_set!("testserver");
}

struct TestFooServer {}
struct TestBarServer {}

type ResponseStream<T> = Pin<Box<dyn Stream<Item = Result<T, Status>> + Send>>;
type ResponseWrapper<T> = Result<Response<T>, Status>;

#[tonic::async_trait]
impl FooService for TestFooServer {
    type GetIntervalStreamStream = ResponseStream<FooStreamResponse>;
    type GetStreamStream = ResponseStream<FooStreamResponse>;

    async fn say_hello(&self, request: Request<FooRequest>) -> ResponseWrapper<proto::FooResponse> {
        Ok(Response::new(proto::FooResponse {
            message: format!("Hello, {}!", request.into_inner().name),
        }))
    }

    async fn get_interval_stream(
        &self,
        request: Request<FooStreamIntervalRequest>,
    ) -> ResponseWrapper<Self::GetIntervalStreamStream> {
        let repeat = std::iter::repeat_with(|| FooStreamResponse {
            result: Local::now().to_rfc3339(),
        });

        let mut stream = Box::pin(tokio_stream::iter(repeat).throttle(Duration::from_millis(
            request.into_inner().delay_milliseconds,
        )));

        let (tx, rx) = mpsc::channel(128);

        tokio::spawn(async move {
            while let Some(item) = stream.next().await {
                match tx.send(Result::<_, Status>::Ok(item)).await {
                    Ok(_) => {}
                    Err(_item) => {
                        break;
                    }
                }
            }
        });

        let output_stream = ReceiverStream::new(rx);
        Ok(Response::new(
            Box::pin(output_stream) as Self::GetIntervalStreamStream
        ))
    }

    async fn get_stream(
        &self,
        _request: Request<FooStreamRequest>,
    ) -> ResponseWrapper<Self::GetIntervalStreamStream> {
        let repeat = std::iter::repeat_with(|| FooStreamResponse {
            result: Local::now().to_rfc3339(),
        });
        let mut stream = Box::pin(tokio_stream::iter(repeat).throttle(Duration::from_millis(200)));

        let (tx, rx) = mpsc::channel(128);
        tokio::spawn(async move {
            while let Some(item) = stream.next().await {
                match tx.send(Result::<_, Status>::Ok(item)).await {
                    Ok(_) => {}
                    Err(_item) => {
                        break;
                    }
                }
            }
        });

        let output_stream = ReceiverStream::new(rx);
        Ok(Response::new(
            Box::pin(output_stream) as Self::GetIntervalStreamStream
        ))
    }
}

#[tonic::async_trait]
impl BarService for TestBarServer {
    type GetIntervalStreamStream = ResponseStream<BarStreamResponse>;
    type GetStreamStream = ResponseStream<BarStreamResponse>;

    async fn say_hello(&self, request: Request<BarRequest>) -> ResponseWrapper<proto::BarResponse> {
        Ok(Response::new(proto::BarResponse {
            message: format!("Hello, {}!", request.into_inner().name),
        }))
    }

    async fn get_interval_stream(
        &self,
        request: Request<BarStreamIntervalRequest>,
    ) -> ResponseWrapper<Self::GetIntervalStreamStream> {
        let repeat = std::iter::repeat(BarStreamResponse {
            result: Local::now().to_rfc3339(),
        });
        let mut stream = Box::pin(tokio_stream::iter(repeat).throttle(Duration::from_millis(
            request.into_inner().delay_milliseconds,
        )));

        let (tx, rx) = mpsc::channel(128);
        tokio::spawn(async move {
            while let Some(item) = stream.next().await {
                match tx.send(Result::<_, Status>::Ok(item)).await {
                    Ok(_) => {}
                    Err(_item) => {
                        break;
                    }
                }
            }
        });

        let output_stream = ReceiverStream::new(rx);
        Ok(Response::new(
            Box::pin(output_stream) as Self::GetIntervalStreamStream
        ))
    }

    async fn get_stream(
        &self,
        _request: Request<BarStreamRequest>,
    ) -> ResponseWrapper<Self::GetIntervalStreamStream> {
        let repeat = std::iter::repeat(BarStreamResponse {
            result: Local::now().to_rfc3339(),
        });
        let mut stream = Box::pin(tokio_stream::iter(repeat).throttle(Duration::from_millis(200)));

        let (tx, rx) = mpsc::channel(128);
        tokio::spawn(async move {
            while let Some(item) = stream.next().await {
                match tx.send(Result::<_, Status>::Ok(item)).await {
                    Ok(_) => {}
                    Err(_item) => {
                        break;
                    }
                }
            }
        });

        let output_stream = ReceiverStream::new(rx);
        Ok(Response::new(
            Box::pin(output_stream) as Self::GetIntervalStreamStream
        ))
    }
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let reflection_service = tonic_reflection::server::Builder::configure()
        .register_encoded_file_descriptor_set(proto::FILE_DESCRIPTOR_SET)
        .build_v1()
        .unwrap();

    Server::builder()
        .add_service(reflection_service)
        .add_service(proto::foo_service_server::FooServiceServer::new(
            TestFooServer {},
        ))
        .add_service(proto::bar_service_server::BarServiceServer::new(
            TestBarServer {},
        ))
        .serve("[::1]:50051".to_socket_addrs().unwrap().next().unwrap())
        .await
        .unwrap();

    Ok(())
}
