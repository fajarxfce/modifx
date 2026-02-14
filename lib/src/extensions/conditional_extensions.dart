import 'package:flutter/widgets.dart';

/// Extension methods for conditional modifiers.
extension ConditionalExtensions on Widget {
  /// Apply a transformation conditionally.
  ///
  /// If [condition] is true, applies the [builder] transformation.
  /// Otherwise, returns the widget unchanged.
  Widget when(bool condition, Widget Function(Widget) builder) {
    return condition ? builder(this) : this;
  }

  /// Show or hide the widget based on condition.
  ///
  /// If [visible] is false, the widget is replaced with [replacement]
  /// or an empty SizedBox if no replacement is provided.
  Widget visible(bool visible, {Widget? replacement}) {
    return visible ? this : (replacement ?? const SizedBox.shrink());
  }

  /// Animated visibility with fade in/out effect.
  Widget animatedVisible(
    bool visible, {
    Duration duration = const Duration(milliseconds: 300),
  }) {
    return AnimatedOpacity(
      opacity: visible ? 1.0 : 0.0,
      duration: duration,
      child: this,
    );
  }
}
