import 'package:flutter/widgets.dart';

/// Base class for all modifiers.
///
/// Modifiers are composable transformations that can be applied to widgets.
/// They can be chained together and will be optimized when possible.
abstract class Modifier {
  const Modifier();

  /// Apply this modifier to a widget.
  Widget apply(Widget child);

  /// Combine with another modifier.
  ///
  /// The returned modifier will apply this modifier first, then the other.
  Modifier then(Modifier other) => _CombinedModifier(this, other);

  /// Whether this modifier can be merged with another modifier for optimization.
  bool canMergeWith(Modifier other) => false;

  /// Merge with another modifier for optimization.
  ///
  /// Only called if [canMergeWith] returns true.
  /// Should return a new modifier that combines both effects.
  Modifier? mergeWith(Modifier other) => null;
}

/// Internal class to combine two modifiers.
class _CombinedModifier extends Modifier {
  final Modifier first;
  final Modifier second;

  const _CombinedModifier(this.first, this.second);

  @override
  Widget apply(Widget child) {
    // Try to optimize by merging compatible modifiers
    if (first.canMergeWith(second)) {
      final merged = first.mergeWith(second);
      if (merged != null) {
        return merged.apply(child);
      }
    }

    // Apply modifiers in order: first, then second
    return second.apply(first.apply(child));
  }

  @override
  bool canMergeWith(Modifier other) {
    // Check if the second modifier can merge with the other
    return second.canMergeWith(other);
  }

  @override
  Modifier? mergeWith(Modifier other) {
    // Try to merge the second modifier with the other
    final merged = second.mergeWith(other);
    if (merged != null) {
      return _CombinedModifier(first, merged);
    }
    return null;
  }
}

/// Extension to apply modifiers to widgets.
extension ModifierExtension on Widget {
  /// Apply a modifier to this widget.
  Widget modifier(Modifier mod) => mod.apply(this);
}
