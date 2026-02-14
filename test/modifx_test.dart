import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:modifx/modifx.dart';

void main() {
  group('Layout Modifiers', () {
    testWidgets('padding modifier wraps widget correctly', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: const Text('Test').paddingAll(16)),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));
      expect(padding.padding, const EdgeInsets.all(16));
    });

    testWidgets('paddingSymmetric sets horizontal and vertical padding', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const Text(
            'Test',
          ).paddingSymmetric(horizontal: 20, vertical: 10),
        ),
      );

      final padding = tester.widget<Padding>(find.byType(Padding));
      expect(
        padding.padding,
        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      );
    });

    testWidgets('size modifier sets width and height', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: const Text('Test').size(width: 100, height: 50)),
      );

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.width, 100);
      expect(sizedBox.height, 50);
    });

    testWidgets('width modifier sets width only', (tester) async {
      await tester.pumpWidget(MaterialApp(home: const Text('Test').width(100)));

      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.width, 100);
      expect(sizedBox.height, null);
    });

    testWidgets('center modifier aligns to center', (tester) async {
      await tester.pumpWidget(MaterialApp(home: const Text('Test').center()));

      final align = tester.widget<Align>(find.byType(Align));
      expect(align.alignment, Alignment.center);
    });

    testWidgets('expanded modifier creates Expanded widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Row(children: [const Text('Test').expanded()])),
      );

      final expanded = tester.widget<Expanded>(find.byType(Expanded));
      expect(expanded.flex, 1);
    });
  });

  group('Decoration Modifiers', () {
    testWidgets('background modifier sets color', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: const Text('Test').background(Colors.blue)),
        ),
      );

      // Find the ColoredBox that's a descendant of Scaffold
      final coloredBox = tester.widget<ColoredBox>(
        find.descendant(
          of: find.byType(Scaffold),
          matching: find.byType(ColoredBox),
        ),
      );
      expect(coloredBox.color, Colors.blue);
    });

    testWidgets('cornerRadius modifier clips with border radius', (
      tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: const Text('Test').cornerRadius(8)),
      );

      final clipRRect = tester.widget<ClipRRect>(find.byType(ClipRRect));
      expect(clipRRect.borderRadius, BorderRadius.circular(8));
    });

    testWidgets('border modifier adds border', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const Text('Test').border(color: Colors.red, width: 2),
        ),
      );

      final decoratedBox = tester.widget<DecoratedBox>(
        find.byType(DecoratedBox),
      );
      final decoration = decoratedBox.decoration as BoxDecoration;
      expect(decoration.border, isA<Border>());
    });

    testWidgets('shadow modifier adds box shadow', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: const Text('Test').shadow(blurRadius: 4)),
      );

      final decoratedBox = tester.widget<DecoratedBox>(
        find.byType(DecoratedBox),
      );
      final decoration = decoratedBox.decoration as BoxDecoration;
      expect(decoration.boxShadow, isNotNull);
      expect(decoration.boxShadow!.length, 1);
      expect(decoration.boxShadow![0].blurRadius, 4);
    });

    testWidgets('opacity modifier sets opacity', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: const Text('Test').opacity(0.5)),
      );

      final opacity = tester.widget<Opacity>(find.byType(Opacity));
      expect(opacity.opacity, 0.5);
    });
  });

  group('Gesture Modifiers', () {
    testWidgets('onTap modifier triggers callback', (tester) async {
      bool tapped = false;

      await tester.pumpWidget(
        MaterialApp(home: const Text('Test').onTap(() => tapped = true)),
      );

      await tester.tap(find.text('Test'));
      expect(tapped, true);
    });

    testWidgets('onLongPress modifier triggers callback', (tester) async {
      bool longPressed = false;

      await tester.pumpWidget(
        MaterialApp(
          home: const Text('Test').onLongPress(() => longPressed = true),
        ),
      );

      await tester.longPress(find.text('Test'));
      expect(longPressed, true);
    });
  });

  group('Transform Modifiers', () {
    testWidgets('rotate modifier rotates widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: const Text('Test').rotate(0.5)),
      );

      expect(find.byType(Transform), findsOneWidget);
    });

    testWidgets('scale modifier scales widget', (tester) async {
      await tester.pumpWidget(MaterialApp(home: const Text('Test').scale(2.0)));

      expect(find.byType(Transform), findsOneWidget);
    });

    testWidgets('translate modifier moves widget', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: const Text('Test').translate(x: 10, y: 20)),
      );

      expect(find.byType(Transform), findsOneWidget);
    });
  });

  group('Conditional Modifiers', () {
    testWidgets('when applies transformation when true', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const Text(
            'Test',
          ).when(true, (widget) => widget.paddingAll(16)),
        ),
      );

      expect(find.byType(Padding), findsOneWidget);
    });

    testWidgets('when skips transformation when false', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: const Text(
            'Test',
          ).when(false, (widget) => widget.paddingAll(16)),
        ),
      );

      expect(find.byType(Padding), findsNothing);
    });

    testWidgets('visible shows widget when true', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: const Text('Test').visible(true)),
      );

      expect(find.text('Test'), findsOneWidget);
    });

    testWidgets('visible hides widget when false', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: const Text('Test').visible(false)),
      );

      expect(find.text('Test'), findsNothing);
    });

    testWidgets('animatedVisible shows widget with animation', (tester) async {
      await tester.pumpWidget(
        MaterialApp(home: const Text('Test').animatedVisible(true)),
      );

      expect(find.byType(AnimatedOpacity), findsOneWidget);
      final animatedOpacity = tester.widget<AnimatedOpacity>(
        find.byType(AnimatedOpacity),
      );
      expect(animatedOpacity.opacity, 1.0);
    });
  });

  group('Modifier Chaining', () {
    testWidgets('multiple modifiers can be chained', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: const Text('Test')
                .paddingAll(16)
                .background(Colors.blue)
                .cornerRadius(8)
                .shadow(blurRadius: 4),
          ),
        ),
      );

      expect(find.byType(Padding), findsWidgets);
      expect(find.byType(ColoredBox), findsWidgets);
      expect(find.byType(ClipRRect), findsWidgets);
      expect(find.byType(DecoratedBox), findsWidgets);
    });
  });
}
