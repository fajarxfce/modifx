import 'package:flutter/material.dart';
import '../core/modifier.dart';
import '../modifiers/gestures.dart';

/// Extension methods for gesture modifiers.
extension GestureExtensions on Widget {
  /// Add a tap gesture handler.
  Widget onTap(VoidCallback callback) {
    return modifier(ClickableModifier(onTap: callback));
  }

  /// Add a long press gesture handler.
  Widget onLongPress(VoidCallback callback) {
    return modifier(ClickableModifier(onLongPress: callback));
  }

  /// Add a double tap gesture handler.
  Widget onDoubleTap(VoidCallback callback) {
    return modifier(ClickableModifier(onDoubleTap: callback));
  }

  /// Make the widget clickable with Material ripple effect.
  Widget clickable({
    required VoidCallback onTap,
    Color? splashColor,
    Color? highlightColor,
  }) {
    return InkWell(
      onTap: onTap,
      splashColor: splashColor,
      highlightColor: highlightColor,
      child: this,
    );
  }
}
