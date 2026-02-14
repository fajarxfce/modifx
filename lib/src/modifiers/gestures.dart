import 'package:flutter/widgets.dart';
import '../core/modifier.dart';

/// Gesture modifier for handling taps and touches.
class ClickableModifier extends Modifier {
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final VoidCallback? onDoubleTap;

  const ClickableModifier({this.onTap, this.onLongPress, this.onDoubleTap});

  @override
  Widget apply(Widget child) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      onDoubleTap: onDoubleTap,
      child: child,
    );
  }
}
