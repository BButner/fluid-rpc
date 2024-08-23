import 'package:flutter/material.dart';
import 'package:frpc_gui/core/theme/fluid_colors.dart';

class ExpansionTitle extends StatefulWidget {
  const ExpansionTitle({
    required this.title,
    required this.children,
    this.padding = const EdgeInsets.symmetric(vertical: 8.0),
    super.key,
  });

  final String title;

  final List<Widget> children;

  final EdgeInsets padding;

  @override
  State<ExpansionTitle> createState() => _ExpansionTitleState();
}

class _ExpansionTitleState extends State<ExpansionTitle> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          hoverColor: FluidColors.zinc.shade800,
          onPressed: () => setState(() {
            _isExpanded = !_isExpanded;
          }),
          child: Row(
            children: [
              Text(
                widget.title,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: FluidColors.zinc.shade400,
                    ),
              ),
              AnimatedRotation(
                turns: _isExpanded ? 1.00 / 4.0 : 0.0,
                duration: const Duration(milliseconds: 100),
                child: Icon(
                  Icons.arrow_right_rounded,
                  color: FluidColors.zinc.shade400,
                ),
              ),
            ],
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => AnimatedSize(
            duration: const Duration(milliseconds: 100),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 100),
              child: !_isExpanded
                  ? SizedBox(
                      width: constraints.maxWidth,
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...widget.children,
                        ],
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
}
