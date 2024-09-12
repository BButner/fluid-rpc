import 'package:flutter/material.dart';

class OnboardingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/frpc_tear.png',
              width: 256.0,
              height: 256.0,
            ),
          ),
          Text(
            'Fluid RPC',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ],
      );
}
