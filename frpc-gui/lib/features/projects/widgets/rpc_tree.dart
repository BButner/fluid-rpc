import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RpcTree extends ConsumerStatefulWidget {
  const RpcTree({
    super.key,
  });

  @override
  ConsumerState<RpcTree> createState() => _RpcTreeState();
}

class _RpcTreeState extends ConsumerState<RpcTree> {
  @override
  Widget build(BuildContext context) {
    return const Text('testing');
  }
}
