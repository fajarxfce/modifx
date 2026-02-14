import 'package:flutter/material.dart';
import '../core/modifier.dart';
import '../modifiers/decoration.dart';

/// Extension methods for decoration modifiers.
extension DecorationExtensions on Widget {
  // ==================== Background ====================

  /// Set the background color of the widget.
  Widget background(Color color) {
    return modifier(BackgroundModifier(color));
  }

  // ==================== Border Radius ====================

  /// Add rounded corners to the widget.
  Widget cornerRadius(double radius) {
    return modifier(CornerRadiusModifier(BorderRadius.circular(radius)));
  }

  /// Add rounded corners only on specific corners.
  Widget cornerRadiusOnly({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) {
    return modifier(
      CornerRadiusModifier(
        BorderRadius.only(
          topLeft: Radius.circular(topLeft),
          topRight: Radius.circular(topRight),
          bottomLeft: Radius.circular(bottomLeft),
          bottomRight: Radius.circular(bottomRight),
        ),
      ),
    );
  }

  // ==================== Border ====================

  /// Add a border around the widget.
  Widget border({
    Color color = const Color(0xFF000000),
    double width = 1.0,
    BorderStyle style = BorderStyle.solid,
  }) {
    return modifier(
      BorderModifier(Border.all(color: color, width: width, style: style)),
    );
  }

  // ==================== Shadow ====================

  /// Add a shadow to the widget.
  Widget shadow({
    Color color = const Color(0x42000000), // Colors.black26
    double blurRadius = 4.0,
    Offset offset = Offset.zero,
    double spreadRadius = 0.0,
  }) {
    return modifier(
      ShadowModifier(
        BoxShadow(
          color: color,
          blurRadius: blurRadius,
          offset: offset,
          spreadRadius: spreadRadius,
        ),
      ),
    );
  }

  /// Add Material elevation shadow.
  Widget elevation(double elevation) {
    return Material(elevation: elevation, child: this);
  }

  // ==================== Opacity ====================

  /// Set the opacity of the widget.
  Widget opacity(double opacity) {
    return Opacity(opacity: opacity, child: this);
  }
}
