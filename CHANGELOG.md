# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2026-02-14

### Added
- Initial release of modifx! 🎉
- Core modifier system with chaining and optimization support
- Layout modifiers:
  - Padding (paddingAll, paddingSymmetric, paddingOnly)
  - Size (size, width, height, square)
  - Alignment (center, align, centerLeft, centerRight, topCenter, bottomCenter)
  - Flex (expanded, flexible)
- Decoration modifiers:
  - Background color (background)
  - Corner radius (cornerRadius, cornerRadiusOnly)
  - Border (border)
  - Shadow (shadow)
  - Opacity (opacity)
- Gesture modifiers:
  - Tap events (onTap, onLongPress, onDoubleTap)
  - Material ripple (clickable)
- Transform modifiers:
  - Rotation (rotate)
  - Scale (scale)
  - Translation (translate)
- Conditional modifiers:
  - Conditional application (when)
  - Visibility control (visible, animatedVisible)
- Comprehensive test suite with 22 passing tests
- Example app demonstrating all features
- Complete documentation and README

### Performance
- Automatic optimization of compatible decoration modifiers
- Modifiers are merged into single widgets where possible

[0.1.0]: https://github.com/flutter-gg/modifx/releases/tag/v0.1.0
