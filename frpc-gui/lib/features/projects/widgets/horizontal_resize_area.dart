import 'package:flutter/material.dart';
import 'package:flutter_box_transform/flutter_box_transform.dart';
import 'package:frpc_gui/core/theme/fluid_colors.dart';

class HorizontalResizeArea extends StatefulWidget {
  const HorizontalResizeArea({
    required this.constraints,
    required this.leftChild,
    required this.rightChild,
    super.key,
  });

  final BoxConstraints constraints;

  final Widget leftChild;

  final Widget rightChild;

  @override
  State<HorizontalResizeArea> createState() => _HorizontalResizeAreaState();
}

class _HorizontalResizeAreaState extends State<HorizontalResizeArea> {
  double _leftRatio = 0.5;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        TransformableBox(
          rect: Rect.fromLTWH(
            0.0,
            0.0,
            widget.constraints.maxWidth * _leftRatio,
            widget.constraints.maxHeight,
          ),
          draggable: false,
          allowContentFlipping: false,
          allowFlippingWhileResizing: false,
          enabledHandles: const {
            HandlePosition.right,
          },
          visibleHandles: const {},
          onChanged: (event, details) {
            setState(() {
              _leftRatio = event.rect.width / widget.constraints.maxWidth;
            });
          },
          contentBuilder: (context, rect, flip) => DecoratedBox(
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: FluidColors.zinc.shade800,
                ),
              ),
            ),
            child: widget.leftChild,
          ),
        ),
        TransformableBox(
          rect: Rect.fromLTWH(
            widget.constraints.maxWidth * _leftRatio,
            0.0,
            widget.constraints.maxWidth * (1.0 - _leftRatio),
            widget.constraints.maxHeight,
          ),
          draggable: false,
          allowContentFlipping: false,
          allowFlippingWhileResizing: false,
          enabledHandles: const {
            HandlePosition.left,
          },
          visibleHandles: const {},
          onChanged: (event, details) {
            setState(() {
              _leftRatio = (widget.constraints.maxWidth - event.rect.width) /
                  widget.constraints.maxWidth;
            });
          },
          contentBuilder: (context, rect, flip) => widget.rightChild,
        ),
      ],
    );
  }
}
