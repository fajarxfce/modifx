import 'package:flutter/widgets.dart';
import '../core/modifier.dart';
import '../modifiers/layout.dart';

/// Extension methods for layout modifiers.
extension LayoutExtensions on Widget {
  // ==================== Padding ====================

  /// Add padding around the widget.
  Widget padding(EdgeInsetsGeometry padding) {
    return modifier(PaddingModifier(padding));
  }

  /// Add uniform padding on all sides.
  Widget paddingAll(double value) {
    return padding(EdgeInsets.all(value));
  }

  /// Add symmetric padding.
  Widget paddingSymmetric({double horizontal = 0, double vertical = 0}) {
    return padding(
      EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical),
    );
  }

  /// Add padding only on specific sides.
  Widget paddingOnly({
    double left = 0,
    double top = 0,
    double right = 0,
    double bottom = 0,
  }) {
    return padding(
      EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
    );
  }

  // ==================== Size ====================

  /// Set the size of the widget.
  Widget size({double? width, double? height}) {
    return modifier(SizeModifier(width: width, height: height));
  }

  /// Set the width of the widget.
  Widget width(double width) => size(width: width);

  /// Set the height of the widget.
  Widget height(double height) => size(height: height);

  /// Set the widget to a square with the given size.
  Widget square(double size) => this.size(width: size, height: size);

  // ==================== Alignment ====================

  /// Align the widget within its parent.
  Widget align(AlignmentGeometry alignment) {
    return modifier(AlignModifier(alignment));
  }

  /// Center the widget.
  Widget center() => align(Alignment.center);

  /// Align to center left.
  Widget centerLeft() => align(Alignment.centerLeft);

  /// Align to center right.
  Widget centerRight() => align(Alignment.centerRight);

  /// Align to top center.
  Widget topCenter() => align(Alignment.topCenter);

  /// Align to bottom center.
  Widget bottomCenter() => align(Alignment.bottomCenter);

  // ==================== Flex ====================

  /// Make the widget flexible in a Flex layout.
  Widget flexible({int flex = 1, FlexFit fit = FlexFit.loose}) {
    return modifier(FlexibleModifier(flex: flex, fit: fit));
  }

  /// Make the widget expand to fill available space in a Flex layout.
  Widget expanded({int flex = 1}) {
    return modifier(ExpandedModifier(flex: flex));
  }
}
