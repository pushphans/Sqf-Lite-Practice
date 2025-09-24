import 'package:flutter/material.dart';

class AddNoteDialog extends StatefulWidget {
  final TextEditingController titleController;
  Function() onTap;
  AddNoteDialog({
    super.key,
    required this.titleController,
    required this.onTap,
  });

  @override
  State<AddNoteDialog> createState() => _AddNoteDialogState();
}

class _AddNoteDialogState extends State<AddNoteDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Add New Note.."),

      content: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              maxLines: null,
              minLines: 1,
              controller: widget.titleController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),

            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    widget.titleController.clear();

                    Navigator.pop(context);
                  },
                  child: Text(
                    "Cancel",
                    style: TextStyle(color: Colors.grey.shade900),
                  ),
                ),

                SizedBox(width: 5),

                TextButton(
                  onPressed: widget.onTap,
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey.shade400,
                  ),
                  child: Text(
                    "Add Note",
                    style: TextStyle(color: Colors.grey.shade900),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
