import 'package:countries_world_map/old/countries/north-america/usa/usa.dart';
import 'package:countries_world_map/world_map/canvas/src/canvas_touch_detector.dart';
import 'package:flutter/material.dart';

import 'simple_world_colors.dart';
import 'simple_world_painter.dart';

/// The WorldMap widget returns a combination of Widgets sutable for most use cases
///
/// The Widget tree of this widget is an AspectRatio > LayoutBuilder > Container > RepaintBoundary > CustomPaint > WorldMapPainter
/// Each of these Widgets has an importang roll in making the WorldMap widget easy to implement.
///
/// - AspectRatio makes sure the map keeps the same dimensions as it was designed. Wrap the WorldMap with a SizedBox to override this.
/// - LayoutBuilder takes the dimensions provided by the AspectRatio and give these to his child
/// - Container is used for coloring the background of the map.
/// - RepaintBoundary creates a new view which will only update when the input 'CountryColors' changes.
/// - CustomPaint drawes the actual Map with the WorldMapPainter as painter.

class SimpleWorldMap extends StatelessWidget {
  /// This is the default color for all countries. If not provided the default Color will be grey.
  final Color? defaultCountryColor;

  /// This is basically a list of countries and colors to apply different colors to specific countries.
  final SimpleWorldCountryColors? countryColors;

  /// This is the color behind the counties which will fill up all the blank space like oceans.
  final Color? backgroundColor;
  final USAColors? usaColors;
  final Function(String, TapUpDetails)? callback;

  const SimpleWorldMap(
      {this.defaultCountryColor,
      this.backgroundColor,
      this.countryColors,
      this.callback,
      this.usaColors,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2000 / 857,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
              width: constraints.maxWidth,
              height: constraints.maxHeight,
              color: backgroundColor ?? Colors.transparent,
              child: RepaintBoundary(
                  child: CanvasTouchDetector(
                      builder: (context) => CustomPaint(
                            isComplex: true,
                            size: Size(
                                constraints.maxWidth, constraints.maxHeight),
                            painter: SimpleWorldPainter(
                              context: context,
                              callback: (country, tapdetails) {
                                if (callback != null) {
                                  callback!(country, tapdetails);
                                }
                              },
                              countryColors: countryColors ??
                                  const SimpleWorldCountryColors(),
                              defaultColors: defaultCountryColor ?? Colors.grey,
                              usaColors: usaColors ?? USAColors(),
                            ),
                          ))));
        },
      ),
    );
  }
}
