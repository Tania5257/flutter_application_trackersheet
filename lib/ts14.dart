//14.Build a list where each item can be swiped to reveal additional options like "Delete" or "Edit".


import 'package:flutter/material.dart';

void main() => runApp(SwipeListApp());

class SwipeListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swipe List to Edit or Delete',
      debugShowCheckedModeBanner: false,
      home: SwipeableListScreen(),
    );
  }
}

class SwipeableListScreen extends StatefulWidget {
  @override
  _SwipeableListScreenState createState() => _SwipeableListScreenState();
}

class _SwipeableListScreenState extends State<SwipeableListScreen> {
  List<String> items = List.generate(10, (index) => 'Item ${index + 1}');
  void _editItem(int index) {
  TextEditingController controller = TextEditingController(text: items[index]);

  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text('Edit Item'),
      content: TextField(
        controller: controller,
        autofocus: true,
        
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              items[index] = controller.text;
            });
            Navigator.of(ctx).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Item updated')),
            );
          },
          child: Text('Save'),
        ),
      ],
    ),
  );
}

  

  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Item deleted')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Swipe to Delete or Edit')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];

          return Dismissible(
            key: Key(item),
            background: Container(
              color: Colors.green,
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 20),
              child: Icon(Icons.edit, color: Colors.white),
            ),
            secondaryBackground: Container(
              color: const Color.fromARGB(255, 189, 34, 22),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            confirmDismiss: (direction) async {
              if (direction == DismissDirection.startToEnd) {
                _editItem(index);
                return false; 
              } else if (direction == DismissDirection.endToStart) {
                return await showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Confirm Delete'),
                    content: Text('Are you sure you want to delete ${items[index]}?'),
                    actions: [
                      TextButton(onPressed: () => Navigator.of(ctx).pop(false), child: Text('Cancel')),
                      TextButton(onPressed: () => Navigator.of(ctx).pop(true), child: Text('Delete')),
                    ],
                  ),
                );
              }
              return false;
            },
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                _deleteItem(index);
              }
            },
            child: Card(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
              child: ListTile(
                title: Text(item),
              ),
            ),
          );
        },
      ),
    );
  }
}
