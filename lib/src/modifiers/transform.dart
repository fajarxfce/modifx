import 'package:flutter/widgets.dart';
import '../core/modifier.dart';

/// Rotate modifier - rotates the widget.
class RotateModifier extends Modifier {
  final double angle;
  final Alignment alignment;

  const RotateModifier(this.angle, {this.alignment = Alignment.center});

  @override
  Widget apply(Widget child) {
    return Transform.rotate(angle: angle, alignment: alignment, child: child);
  }
}

/// Scale modifier - scales the widget.
class ScaleModifier extends Modifier {
  final double scale;
  final Alignment alignment;

  const ScaleModifier(this.scale, {this.alignment = Alignment.center});

  @override
  Widget apply(Widget child) {
    return Transform.scale(scale: scale, alignment: alignment, child: child);
  }
}

/// Translate modifier - translates/moves the widget.
class TranslateModifier extends Modifier {
  final Offset offset;

  const TranslateModifier(this.offset);

  @override
  Widget apply(Widget child) {
    return Transform.translate(offset: offset, child: child);
  }
}
