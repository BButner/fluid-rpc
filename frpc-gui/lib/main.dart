import 'package:flutter/material.dart';
import 'package:frpc_gui/src/rust/api/simple.dart';
import 'package:frpc_gui/src/rust/frb_generated.dart';

Future<void> main() async {
  await RustLib.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _hostnameController = TextEditingController();
  final _targetController = TextEditingController();

  List<String> replies = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('flutter_rust_bridge quickstart')),
        body: Column(
          children: [
            TextField(
              controller: _hostnameController,
            ),
            TextField(
              controller: _targetController,
            ),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  replies = [];
                });

                final stream = await testInvoke(
                  serverUrl: _hostnameController.text,
                  target: _targetController.text,
                );

                await for (final res in stream) {
                  setState(() {
                    replies.add(res);
                  });
                }
              },
              child: const Text('Test'),
            ),
            Expanded(
              child: ListView(
                children: [
                  for (final reply in replies) Text(reply),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
