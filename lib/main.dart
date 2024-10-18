import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Midterm Exam - Feltimos_John_Michael',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Feltimos_John_Michael_MidtermExam'),
        ),
        body: ItemList(),
      ),
    );
  }
}

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  final List<String> items = [
    'Apple',
    'Banana',
    'Carrot',
    'Dragonfruit',
    'Eggplant',
    'Fig',
    'Grape',
    'Honeydew',
    'Iced Tea',
    'Jackfruit',
  ];

  final List<bool> isAdded = List.filled(10, false);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Card(
          color: isAdded[index] ? Colors.green[100] : Colors.white,
          child: ListTile(
            title: Text(items[index]),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    print('Details of ${items[index]}');
                  },
                  child: Text('Details'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isAdded[index] = !isAdded[index];
                    });
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                        isAdded[index] ? Colors.green : Colors.blue),
                  ),
                  child: Text(isAdded[index] ? 'Added' : 'Add'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
