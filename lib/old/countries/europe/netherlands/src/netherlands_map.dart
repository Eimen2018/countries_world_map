import 'package:countries_world_map/world_map/canvas/src/canvas_touch_detector.dart';
import 'package:flutter/material.dart';

import 'netherlands_colors.dart';
import 'netherlands_painter.dart';

class NetherlandsMap extends StatelessWidget {
  /// This is the default color for all countries. If not provided the default Color will be grey.
  final Color? defaultColor;
  final Color? backgroundColor;

  /// This is basically a list of countries and colors to apply different colors to specific countries.
  final NetherlandsColors? netherlandsColors;

  final Function(String, TapUpDetails)? callback;

  const NetherlandsMap(
      {this.backgroundColor,
      this.defaultColor,
      this.callback,
      this.netherlandsColors,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 612.54211 / 723.61865,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
            color: backgroundColor ?? Colors.transparent,
            child: CanvasTouchDetector(
              builder: (context) => CustomPaint(
                  isComplex: true,
                  size: Size(constraints.maxWidth, constraints.maxHeight),
                  painter: NetherlandsPainter(
                      callback: (province, details) {
                        if (callback != null) {
                          callback!(province, details);
                        }
                      },
                      context: context,
                      netherlandsColors:
                          netherlandsColors ?? NetherlandsColors(),
                      defaultColor: defaultColor ?? Colors.grey)),
            ),
          );
        },
      ),
    );
  }
}
