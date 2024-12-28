import 'package:flutter/material.dart';

class PopupWindow {
  static void addFolder(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newFolderName = '';
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          title: const Text('Add New Folder'),
          content: TextField(
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'Enter folder name',
              labelText: 'Folder Name',
            ),
            onChanged: (value) {
              newFolderName = value;
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (newFolderName.isNotEmpty) {
                  // TODO: Add folder creation logic here
                  Navigator.pop(context);
                }
              },
              child: const Text('Create'),
            ),
          ],
        );
      },
    );
  }
}