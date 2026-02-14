import 'package:flutter/widgets.dart';
import '../core/modifier.dart';
import '../modifiers/transform.dart';

/// Extension methods for transform modifiers.
extension TransformExtensions on Widget {
  /// Rotate the widget by the given angle (in radians).
  Widget rotate(double angle, {Alignment alignment = Alignment.center}) {
    return modifier(RotateModifier(angle, alignment: alignment));
  }

  /// Scale the widget by the given factor.
  Widget scale(double scale, {Alignment alignment = Alignment.center}) {
    return modifier(ScaleModifier(scale, alignment: alignment));
  }

  /// Translate/move the widget by the given offset.
  Widget translate({double x = 0, double y = 0}) {
    return modifier(TranslateModifier(Offset(x, y)));
  }
}
