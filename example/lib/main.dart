import 'package:flutter/material.dart';
import 'package:modifx/modifx.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'modifx Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const ModifxDemoPage(),
    );
  }
}

class ModifxDemoPage extends StatefulWidget {
  const ModifxDemoPage({super.key});

  @override
  State<ModifxDemoPage> createState() => _ModifxDemoPageState();
}

class _ModifxDemoPageState extends State<ModifxDemoPage> {
  bool _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('modifx Demo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Section: Simple Button
            buildSection(
              'Simple Button',
              const Text('Click Me')
                  .paddingAll(16)
                  .background(Colors.blue)
                  .cornerRadius(8)
                  .onTap(_showMessage)
                  .paddingSymmetric(horizontal: 16, vertical: 8),
            ),

            // Section: Card with Shadow
            buildSection(
              'Card with Shadow',
              Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Card Title',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'This is a beautiful card with shadow effect.',
                      ),
                    ],
                  )
                  .paddingAll(16)
                  .background(Colors.white)
                  .cornerRadius(12)
                  .shadow(blurRadius: 8, color: Colors.black12)
                  .paddingAll(16),
            ),

            // Section: Conditional Visibility
            buildSection(
              'Conditional Visibility',
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () => setState(() => _isVisible = !_isVisible),
                    child: Text(_isVisible ? 'Hide' : 'Show'),
                  ),
                  const SizedBox(height: 16),
                  const Text('Animated Text')
                      .paddingAll(16)
                      .background(Colors.green)
                      .cornerRadius(8)
                      .animatedVisible(_isVisible),
                ],
              ).paddingAll(16),
            ),

            // Section: Complex Composition
            buildSection(
              'Complex Composition',
              Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber)
                          .paddingAll(8)
                          .background(Colors.amber.shade100)
                          .cornerRadius(20)
                          .onTap(_showMessage),
                      const Text(
                        'Premium Feature',
                      ).paddingSymmetric(horizontal: 12).expanded(),
                      const Text('NEW')
                          .paddingSymmetric(horizontal: 8, vertical: 4)
                          .background(Colors.red)
                          .cornerRadius(4),
                    ],
                  )
                  .paddingAll(16)
                  .background(Colors.grey.shade100)
                  .cornerRadius(8)
                  .border(color: Colors.grey.shade300)
                  .onTap(_showMessage)
                  .paddingAll(16),
            ),

            // Section: Transformations
            buildSection(
              'Transformations',
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.favorite,
                    size: 40,
                    color: Colors.red,
                  ).rotate(0.3).paddingAll(8),
                  const Icon(
                    Icons.star,
                    size: 40,
                    color: Colors.amber,
                  ).scale(1.5).paddingAll(8),
                  const Icon(
                    Icons.check_circle,
                    size: 40,
                    color: Colors.green,
                  ).translate(x: 10, y: -5).paddingAll(8),
                ],
              ).paddingAll(16),
            ),

            // Section: Multiple Shadows
            buildSection(
              'Gradient-like Multiple Shadows',
              const Text('Elevated Box')
                  .paddingAll(24)
                  .background(Colors.white)
                  .cornerRadius(16)
                  .shadow(
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                    color: Colors.black12,
                  )
                  .shadow(
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                    color: Colors.black12,
                  )
                  .paddingAll(16),
            ),

            // Section: Opacity
            buildSection(
              'Opacity',
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: Colors.blue,
                    width: 50,
                    height: 50,
                  ).opacity(1.0),
                  Container(
                    color: Colors.blue,
                    width: 50,
                    height: 50,
                  ).opacity(0.7),
                  Container(
                    color: Colors.blue,
                    width: 50,
                    height: 50,
                  ).opacity(0.4),
                  Container(
                    color: Colors.blue,
                    width: 50,
                    height: 50,
                  ).opacity(0.1),
                ],
              ).paddingAll(16),
            ),

            // Section: Gesture Events
            buildSection(
              'Gesture Events',
              Column(
                children: [
                  const Text('Tap me')
                      .paddingAll(12)
                      .background(Colors.blue)
                      .cornerRadius(8)
                      .onTap(() => _showSnackBar('Tapped!'))
                      .paddingAll(4),
                  const Text('Long press me')
                      .paddingAll(12)
                      .background(Colors.orange)
                      .cornerRadius(8)
                      .onLongPress(() => _showSnackBar('Long pressed!'))
                      .paddingAll(4),
                  const Text('Double tap me')
                      .paddingAll(12)
                      .background(Colors.purple)
                      .cornerRadius(8)
                      .onDoubleTap(() => _showSnackBar('Double tapped!'))
                      .paddingAll(4),
                ],
              ).paddingAll(16),
            ),

            // Section: Traditional vs modifx Comparison
            buildSection(
              'Traditional vs modifx',
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Traditional Flutter:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(blurRadius: 4, color: Colors.black26),
                      ],
                    ),
                    child: const Text('Nested hell'),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'With modifx:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  const Text('Clean & readable')
                      .paddingAll(16)
                      .background(Colors.blue)
                      .cornerRadius(8)
                      .shadow(blurRadius: 4, color: Colors.black26),
                ],
              ).paddingAll(16),
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }

  Widget buildSection(String title, Widget content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        content,
        const SizedBox(height: 24),
      ],
    );
  }

  void _showMessage() {
    _showSnackBar('Item clicked!');
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 1)),
    );
  }
}
