import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Card List',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: CardListScreen(),
    );
  }
}

class CardListScreen extends StatelessWidget {
  final List<Map<String, String>> items = List.generate(5, (index) {
    return {
      "image": "assets/card_$index.jpg",
      "title": "Card Title $index",
      "subtitle": "Subtitle $index",
      "description": "This is a longer description for card item number $index."
    };
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated Cards")),
      body: ListView.builder(
        padding: EdgeInsets.all(12),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return AnimatedCardWidget(
            imageAssetPath: item['image']!,
            title: item['title']!,
            subtitle: item['subtitle']!,
            description: item['description']!,
          );
        },
      ),
    );
  }
}

class AnimatedCardWidget extends StatefulWidget {
  final String imageAssetPath, title, subtitle, description;

  const AnimatedCardWidget({
    required this.imageAssetPath,
    required this.title,
    required this.subtitle,
    required this.description,
  });

  @override
  _AnimatedCardWidgetState createState() => _AnimatedCardWidgetState();
}

class _AnimatedCardWidgetState extends State<AnimatedCardWidget>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;

  void _onTapDown(_) => setState(() => _scale = 0.97);
  void _onTapUp(_) => setState(() => _scale = 1.0);
  void _onTapCancel() => setState(() => _scale = 1.0);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${widget.title} tapped')),
        );
      },
      child: AnimatedScale(
        scale: _scale,
        duration: Duration(milliseconds: 150),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 6,
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.asset(
                  widget.imageAssetPath,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              ListTile(
                title: Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text(widget.subtitle),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(widget.description),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
