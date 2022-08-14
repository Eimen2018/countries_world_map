import 'package:countries_world_map/old/countries/north-america/usa/usa.dart';
import 'package:countries_world_map/world_map/canvas/src/touchy_canvas.dart';
import 'package:flutter/material.dart';

import 'painter/i1.dart';
import 'painter/i10.dart';
import 'painter/i2.dart';
import 'painter/i3.dart';
import 'painter/i4.dart';
import 'painter/i5.dart';
import 'painter/i6.dart';
import 'painter/i7.dart';
import 'painter/i8.dart';
import 'painter/i9.dart';
import 'simple_world_colors.dart';

/// This painter will paint a world map with all///
/// Giving countries a different color based on a data set can help visualize data.

class SimpleWorldPainter extends CustomPainter {
  /// This Color is used for all the countries that have no custom color
  final Color defaultColors;
  final BuildContext context;

  /// The CountryColors is basically a list of Countries and Colors to give a Countrie a color of choice.
  final SimpleWorldCountryColors countryColors;
  final USAColors usaColors;
  final Function(String, TapUpDetails) callback;

  const SimpleWorldPainter(
      {required this.defaultColors,
      required this.countryColors,
      required this.context,
      required this.callback,
      required this.usaColors,
      });
// ignore_for_file: avoid_renaming_method_parameters
  @override
  void paint(Canvas c, Size s) {
    var canvas = TouchyCanvas(context, c);
    // var recorder = ui.PictureRecorder();
    // Canvas canvas = Canvas(recorder);

    iOne(s, canvas, countryColors, defaultColors, callback);
    iTwo(s, canvas, countryColors, defaultColors, callback);
    iThree(s, canvas, countryColors, defaultColors, callback);
    iFour(s, canvas, countryColors, defaultColors, callback);
    iFive(s, canvas, countryColors, defaultColors, callback);
    iSix(s, canvas, countryColors, defaultColors, callback);
    iTen(s, canvas, usaColors, defaultColors, callback);
    iSeven(s, canvas, countryColors, defaultColors, callback);
    iEight(s, canvas, countryColors, defaultColors, callback);
    iNine(s, canvas, countryColors, defaultColors, callback);
  }

  @override
  bool shouldRepaint(SimpleWorldPainter oldDelegate) =>
      oldDelegate.countryColors != countryColors;
}
