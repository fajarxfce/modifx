# modifx

**Compose-style modifiers for Flutter - Say goodbye to widget nesting hell**

[![pub package](https://img.shields.io/pub/v/modifx.svg)](https://pub.dev/packages/modifx)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

Inspired by Jetpack Compose's modifier system, **modifx** brings a clean, chainable API to Flutter that eliminates excessive widget nesting and makes your UI code more readable and maintainable.

## ✨ Features

- 🎯 **Clean syntax** - Chain modifiers instead of nesting widgets
- 🚀 **Performance optimized** - Automatically merges compatible modifiers
- 📦 **Comprehensive** - Layout, decoration, gestures, transforms, and more
- 🔧 **Type-safe** - Full IDE support with autocomplete
- 🎨 **Familiar** - Works seamlessly with existing Flutter code

## 🆚 Before & After

### Traditional Flutter:
```dart
Container(
  padding: EdgeInsets.all(16),
  decoration: BoxDecoration(
    color: Colors.blue,
    borderRadius: BorderRadius.circular(8),
    boxShadow: [BoxShadow(blurRadius: 4)],
  ),
  child: Text('Hello'),
)
```

### With modifx:
```dart
Text('Hello')
  .paddingAll(16)
  .background(Colors.blue)
  .cornerRadius(8)
  .shadow(blurRadius: 4)
```

**30% less code, 100% more readable!** 🎉

## 📦 Installation

Add to your `pubspec.yaml`:

```yaml
dependencies:
  modifx: ^0.1.0
```

Then run:

```bash
flutter pub get
```

## 🚀 Quick Start

```dart
import 'package:flutter/material.dart';
import 'package:modifx/modifx.dart';

// Simple button
Text('Click Me')
  .paddingAll(16)
  .background(Colors.blue)
  .cornerRadius(8)
  .onTap(() => print('Clicked!'));

// Card with shadow
Column(
  children: [
    Text('Card Title', style: TextStyle(fontWeight: FontWeight.bold)),
    Text('Card content'),
  ],
)
  .paddingAll(16)
  .background(Colors.white)
  .cornerRadius(12)
  .shadow(blurRadius: 8, color: Colors.black12);

// Conditional visibility
Text('Toggle me')
  .paddingAll(16)
  .background(Colors.green)
  .visible(isVisible);
```

## 📚 Available Modifiers

### Layout Modifiers

```dart
// Padding
widget.paddingAll(16)
widget.paddingSymmetric(horizontal: 16, vertical: 8)
widget.paddingOnly(left: 10, top: 5, right: 10, bottom: 5)

// Size
widget.size(width: 100, height: 50)
widget.width(100)
widget.height(50)
widget.square(50)

// Alignment
widget.center()
widget.centerLeft()
widget.centerRight()
widget.align(Alignment.topCenter)

// Flex
widget.expanded(flex: 1)
widget.flexible(flex: 1, fit: FlexFit.loose)
```

### Decoration Modifiers

```dart
// Background
widget.background(Colors.blue)

// Corner radius
widget.cornerRadius(8)
widget.cornerRadiusOnly(topLeft: 8, topRight: 8)

// Border
widget.border(color: Colors.black, width: 2)

// Shadow
widget.shadow(blurRadius: 4, color: Colors.black26, offset: Offset(0, 2))

// Opacity
widget.opacity(0.5)
```

### Gesture Modifiers

```dart
// Tap events
widget.onTap(() => print('Tapped!'))
widget.onLongPress(() => print('Long pressed!'))
widget.onDoubleTap(() => print('Double tapped!'))

// Material ripple
widget.clickable(
  onTap: () => print('Clicked!'),
  splashColor: Colors.blue.withOpacity(0.3),
)
```

### Transform Modifiers

```dart
// Rotation (angle in radians)
widget.rotate(0.5)

// Scale
widget.scale(1.5)

// Translation
widget.translate(x: 10, y: 20)
```

### Conditional Modifiers

```dart
// Conditional transformation
widget.when(condition, (w) => w.paddingAll(16))

// Visibility
widget.visible(isVisible)
widget.visible(isVisible, replacement: Text('Hidden'))

// Animated visibility
widget.animatedVisible(isVisible, duration: Duration(milliseconds: 300))
```

## 🎨 Real-World Examples

### Button with Ripple Effect

```dart
Text('Login')
  .paddingSymmetric(horizontal: 32, vertical: 16)
  .background(Colors.blue)
  .cornerRadius(24)
  .clickable(
    onTap: () => login(),
    splashColor: Colors.white.withOpacity(0.3),
  );
```

### Profile Card

```dart
Row(
  children: [
    Icon(Icons.person).paddingAll(12),
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('John Doe', style: TextStyle(fontWeight: FontWeight.bold)),
        Text('john@example.com', style: TextStyle(color: Colors.grey)),
      ],
    ).expanded(),
  ],
)
  .paddingAll(16)
  .background(Colors.white)
  .cornerRadius(12)
  .shadow(blurRadius: 8, color: Colors.black.withOpacity(0.1))
  .onTap(() => showProfile());
```

### Animated Toggle

```dart
Container(color: Colors.green)
  .size(width: 50, height: 50)
  .cornerRadius(8)
  .animatedVisible(
    isToggled,
    duration: Duration(milliseconds: 300),
  );
```

## 🔧 Advanced Usage

### Chaining Multiple Modifiers

Modifiers can be chained infinitely and are applied from bottom to top (closest to farthest from the child):

```dart
Text('Hello')
  .paddingAll(8)           // 1. Applied first (closest to Text)
  .background(Colors.blue)  // 2. Applied second
  .cornerRadius(8)          // 3. Applied third
  .paddingAll(16)           // 4. Applied last (farthest from Text)
```

### Performance Optimization

modifx automatically optimizes compatible modifiers:

```dart
// These three modifiers will be merged into a single DecoratedBox!
widget
  .background(Colors.blue)
  .border(color: Colors.black)
  .shadow(blurRadius: 4)
```

### Custom Modifiers

You can create your own modifiers by extending the `Modifier` class:

```dart
class CustomModifier extends Modifier {
  @override
  Widget apply(Widget child) {
    return YourCustomWidget(child: child);
  }
}

// Use it
extension CustomExtension on Widget {
  Widget custom() => modifier(CustomModifier());
}
```

## 🤝 Contributing

Contributions are welcome! Please read our [contributing guide](CONTRIBUTING.md) to get started.

### Adding New Modifiers

1. Create a new modifier class in `lib/src/modifiers/`
2. Add extension methods in `lib/src/extensions/`
3. Export in `lib/modifx.dart`
4. Add tests in `test/`
5. Update documentation

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- Inspired by [Jetpack Compose](https://developer.android.com/jetpack/compose) modifier system
- Built with ❤️ for the Flutter community

## 🔗 Links

- [Pub.dev](https://pub.dev/packages/modifx)
- [GitHub](https://github.com/fajarxfce/modifx)
- [Documentation](https://github.com/fajarxfce/modifx#readme)
- [Issue Tracker](https://github.com/fajarxfce/modifx/issues)

---

**Made with 🚀 by Flutter GG**
