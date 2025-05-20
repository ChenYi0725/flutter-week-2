import 'package:flutter/material.dart';
import 'note_database.dart';
import 'package:flutter_week2/color_pool.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> titles = ['test1'];
  List<String> des = ['test1'];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              titles.add('test');
              des.add('test');
            });
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(title: const Text('Flutter Week 2')),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return NoteCard(
                title: titles[index],
                des: des[index],
                index: index,
                remove: () {
                  setState(() {
                    titles.removeAt(index);
                    des.removeAt(index);
                  });
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class NoteCard extends StatelessWidget {
  final String title;
  final String des;
  final int index;
  final void Function() remove;

  const NoteCard({
    super.key,
    required this.title,
    required this.des,
    required this.index,
    required this.remove,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorPool[index % colorPool.length],
        borderRadius: BorderRadius.circular(30),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: remove,
                icon: FaIcon(
                  FontAwesomeIcons.trash,
                  color: Colors.grey.shade500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            des,
            style: TextStyle(fontSize: 17, color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }
}

// MasonryGridView.count(
// crossAxisCount: 2,
// mainAxisSpacing: 12,
// crossAxisSpacing: 12,
// itemCount: noteDatabase.length,
// itemBuilder: (context, index) {
// final note = noteDatabase[index];
// return NoteCard(title: note.$1, des: note.$2, index: index);
// },
// ),
