use bytes::{Buf, BufMut};
use prost::Message;
use prost_reflect::{DynamicMessage, MessageDescriptor};
use tonic::codec::{BufferSettings, Codec, DecodeBuf, Decoder, EncodeBuf, Encoder};
use tonic::Status;

pub struct DynamicMessageCodec {
    descriptor: MessageDescriptor,
}

impl DynamicMessageCodec {
    pub fn new(descriptor: MessageDescriptor) -> Self {
        DynamicMessageCodec { descriptor }
    }
}

impl Codec for DynamicMessageCodec {
    type Encode = DynamicMessage;
    type Decode = DynamicMessage;

    type Encoder = DynamicMessageEncoder;
    type Decoder = DynamicMessageDecoder;

    fn encoder(&mut self) -> Self::Encoder {
        DynamicMessageEncoder
    }

    fn decoder(&mut self) -> Self::Decoder {
        DynamicMessageDecoder::new(self.descriptor.clone())
    }
}

pub struct DynamicMessageEncoder;

impl Encoder for DynamicMessageEncoder {
    type Item = DynamicMessage;
    type Error = Status;

    fn encode(&mut self, item: Self::Item, dst: &mut EncodeBuf<'_>) -> Result<(), Self::Error> {
        let mut buf = Vec::new();
        item.encode(&mut buf)
            .map_err(|e| Status::internal(e.to_string()))?;
        dst.put_slice(&buf);
        Ok(())
    }

    fn buffer_settings(&self) -> BufferSettings {
        BufferSettings::default()
    }
}

pub struct DynamicMessageDecoder {
    descriptor: MessageDescriptor,
}

impl DynamicMessageDecoder {
    pub fn new(descriptor: MessageDescriptor) -> Self {
        DynamicMessageDecoder { descriptor }
    }
}

impl Decoder for DynamicMessageDecoder {
    type Item = DynamicMessage;
    type Error = Status;

    fn decode(&mut self, src: &mut DecodeBuf<'_>) -> Result<Option<Self::Item>, Self::Error> {
        if src.remaining() == 0 {
            return Ok(None);
        }

        let descriptor = self.descriptor.clone();

        let message =
            DynamicMessage::decode(descriptor, src).map_err(|e| Status::internal(e.to_string()))?;
        Ok(Some(message))
    }

    fn buffer_settings(&self) -> BufferSettings {
        BufferSettings::default()
    }
}
