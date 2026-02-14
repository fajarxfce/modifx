import 'package:flutter/widgets.dart';
import '../core/modifier.dart';

/// Padding modifier - adds padding around a widget.
class PaddingModifier extends Modifier {
  final EdgeInsetsGeometry padding;

  const PaddingModifier(this.padding);

  @override
  Widget apply(Widget child) => Padding(padding: padding, child: child);
}

/// Size modifier - sets width and/or height.
class SizeModifier extends Modifier {
  final double? width;
  final double? height;

  const SizeModifier({this.width, this.height});

  @override
  Widget apply(Widget child) {
    return SizedBox(width: width, height: height, child: child);
  }
}

/// Alignment modifier - aligns child within available space.
class AlignModifier extends Modifier {
  final AlignmentGeometry alignment;

  const AlignModifier(this.alignment);

  @override
  Widget apply(Widget child) => Align(alignment: alignment, child: child);
}

/// Flexible modifier - makes child flexible in a Flex layout.
class FlexibleModifier extends Modifier {
  final int flex;
  final FlexFit fit;

  const FlexibleModifier({this.flex = 1, this.fit = FlexFit.loose});

  @override
  Widget apply(Widget child) => Flexible(flex: flex, fit: fit, child: child);
}

/// Expanded modifier - expands child to fill available space in a Flex layout.
class ExpandedModifier extends Modifier {
  final int flex;

  const ExpandedModifier({this.flex = 1});

  @override
  Widget apply(Widget child) => Expanded(flex: flex, child: child);
}
