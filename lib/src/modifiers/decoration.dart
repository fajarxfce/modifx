import 'package:flutter/material.dart';
import '../core/modifier.dart';

/// Background color modifier.
class BackgroundModifier extends Modifier {
  final Color color;

  const BackgroundModifier(this.color);

  @override
  Widget apply(Widget child) => ColoredBox(color: color, child: child);

  @override
  bool canMergeWith(Modifier other) {
    return other is DecorationModifier;
  }

  @override
  Modifier? mergeWith(Modifier other) {
    if (other is DecorationModifier) {
      return DecorationModifier(
        decoration: other.decoration.copyWith(color: color),
      );
    }
    return null;
  }
}

/// Border radius modifier - clips child with rounded corners.
class CornerRadiusModifier extends Modifier {
  final BorderRadiusGeometry borderRadius;

  const CornerRadiusModifier(this.borderRadius);

  @override
  Widget apply(Widget child) {
    return ClipRRect(borderRadius: borderRadius as BorderRadius, child: child);
  }
}

/// General decoration modifier - supports merging multiple decoration properties.
class DecorationModifier extends Modifier {
  final BoxDecoration decoration;

  const DecorationModifier({required this.decoration});

  @override
  Widget apply(Widget child) {
    return DecoratedBox(decoration: decoration, child: child);
  }

  @override
  bool canMergeWith(Modifier other) {
    return other is BackgroundModifier ||
        other is BorderModifier ||
        other is ShadowModifier;
  }

  @override
  Modifier? mergeWith(Modifier other) {
    BoxDecoration merged = decoration;

    if (other is BackgroundModifier) {
      merged = merged.copyWith(color: other.color);
    } else if (other is BorderModifier) {
      merged = merged.copyWith(border: other.border);
    } else if (other is ShadowModifier) {
      final existingShadows = merged.boxShadow ?? [];
      merged = merged.copyWith(boxShadow: [...existingShadows, other.shadow]);
    }

    return DecorationModifier(decoration: merged);
  }
}

/// Border modifier.
class BorderModifier extends Modifier {
  final BoxBorder border;

  const BorderModifier(this.border);

  @override
  Widget apply(Widget child) {
    return DecoratedBox(
      decoration: BoxDecoration(border: border),
      child: child,
    );
  }

  @override
  bool canMergeWith(Modifier other) {
    return other is DecorationModifier;
  }

  @override
  Modifier? mergeWith(Modifier other) {
    if (other is DecorationModifier) {
      return DecorationModifier(
        decoration: other.decoration.copyWith(border: border),
      );
    }
    return null;
  }
}

/// Shadow modifier.
class ShadowModifier extends Modifier {
  final BoxShadow shadow;

  const ShadowModifier(this.shadow);

  @override
  Widget apply(Widget child) {
    return DecoratedBox(
      decoration: BoxDecoration(boxShadow: [shadow]),
      child: child,
    );
  }

  @override
  bool canMergeWith(Modifier other) {
    return other is DecorationModifier;
  }

  @override
  Modifier? mergeWith(Modifier other) {
    if (other is DecorationModifier) {
      final existingShadows = other.decoration.boxShadow ?? [];
      return DecorationModifier(
        decoration: other.decoration.copyWith(
          boxShadow: [...existingShadows, shadow],
        ),
      );
    }
    return null;
  }
}
