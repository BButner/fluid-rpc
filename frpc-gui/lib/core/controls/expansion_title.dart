import 'package:flutter/material.dart';
import 'package:frpc_gui/core/theme/fluid_colors.dart';

class ExpansionTitle extends StatefulWidget {
  const ExpansionTitle({
    required this.title,
    required this.children,
    super.key,
  });

  final String title;

  final List<Widget> children;

  @override
  State<ExpansionTitle> createState() => _ExpansionTitleState();
}

class _ExpansionTitleState extends State<ExpansionTitle> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6.0),
          ),
          hoverColor: FluidColors.zinc.shade900,
          onPressed: () => setState(() {
            _isExpanded = !_isExpanded;
          }),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  widget.title,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ],
          ),
        ),
        AnimatedSize(
          duration: const Duration(milliseconds: 100),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: _isExpanded ? double.infinity : 0.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: widget.children,
            ),
          ),
        ),
      ],
    );
  }
}
