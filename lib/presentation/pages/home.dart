import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_practice_flutter/data/models/notes.dart';
import 'package:sqflite_practice_flutter/presentation/providers/database_provider.dart';
import 'package:sqflite_practice_flutter/utils/widgets/add_note_dialog.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final titleController = TextEditingController();
  openAddNoteDialog() {
    showDialog(
      context: context,
      builder: (context) => AddNoteDialog(
        titleController: titleController,
        onTap: () {
          Notes note = Notes(
            title: titleController.text.trim(),
            createdAt: DateTime.now().toString(),
          );

          Provider.of<DatabaseProvider>(context, listen: false).addNote(note);
          titleController.clear();
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    Provider.of<DatabaseProvider>(context, listen: false).getNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 10.00),
        child: AppBar(),
      ),

      body: Consumer<DatabaseProvider>(
        builder: (context, value, child) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "Notes!!",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 55),
                  ),
                ),

                IconButton(
                  onPressed: openAddNoteDialog,
                  icon: Icon(Icons.add, color: Colors.grey.shade600, size: 40),
                ),
              ],
            ),

            Expanded(
              child: ListView.builder(
                itemCount: value.notesList.length,
                itemBuilder: (context, index) {
                  final unit = value.notesList[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 10,
                    ),
                    child: ListTile(
                      tileColor: Colors.grey.shade600,
                      title: Text(
                        unit.title,
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                      subtitle: Text(
                        unit.createdAt,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
