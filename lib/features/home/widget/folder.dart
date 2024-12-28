import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/color.dart';
import 'package:flutter_application_1/features/home/widget/popup_window.dart';

class Folder extends StatelessWidget {
  final int index;
  const Folder({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(
          Icons.folder,
          color: AppColors.primary,
          size: 32,
        ),
        title: Text(
          'Folder ${index + 1}',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: PopupMenuButton(
          iconSize: 20,
          itemBuilder: (context) => [
            PopupMenuItem(
              value: 'rename',
              child: Text('Rename'),
              onTap: () {
                PopupWindow.addFolder(context);
              },
            ),
            const PopupMenuItem(
              value: 'delete',
              child: Text('Delete'),
            ),
          ],
          onSelected: (value) {},
        ),
      ),
    );
  }
}
