import 'dart:async';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frpc_gui/features/app_config/app_config_provider.dart';
import 'package:go_router/go_router.dart';

class OnboardingWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(256.0 * 0.2),
                  child: Image.asset(
                    'assets/frpc_app_icon.png',
                    width: 256.0,
                    height: 256.0,
                  ),
                ),
                Text(
                  'Fluid RPC',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ],
            ),
          ),
          Expanded(
            // flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FilledButton(
                      onPressed: () {
                        final router = GoRouter.of(context);

                        print('pls');

                        router.push('/project/new');
                      },
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.all(32.0),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(
                              Icons.add_rounded,
                              size: 64.0,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                          Text(
                            'New',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 48.0),
                    FilledButton(
                      onPressed: () async {
                        final result = await FilePicker.platform.pickFiles(
                          dialogTitle: 'Fluid RPC Project',
                          type: FileType.custom,
                          allowedExtensions: [
                            'frpc',
                          ],
                        );

                        if (result != null && result.files.isNotEmpty) {
                          final projPath = result.files.first.path;

                          if (projPath != null) {
                            await ref
                                .read(applicationConfigProvider.notifier)
                                .addToCacheFromFile(projPath);
                          }
                        }
                      },
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.all(32.0),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Icon(
                              Icons.folder_open_rounded,
                              size: 64.0,
                              color: Theme.of(context).colorScheme.tertiary,
                            ),
                          ),
                          Text(
                            'Open',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
}
