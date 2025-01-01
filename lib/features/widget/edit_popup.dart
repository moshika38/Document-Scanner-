import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/color.dart';
import 'package:flutter_application_1/features/home/services/document_services.dart';
import 'package:provider/provider.dart';

class RenamePopup {
  void rename(
      BuildContext context, String imagePath, bool isPop, String currentName) {
    TextEditingController controller = TextEditingController(text: currentName);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Rename Document',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.descriptionText,
                fontSize: 24,
              ),
        ),
        content: TextField(
          controller: controller,
          autofocus: true,
          style: Theme.of(context).textTheme.bodySmall,
          decoration: InputDecoration(
            hintText: "Enter new name",
            hintStyle: Theme.of(context).textTheme.bodySmall,
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColors.primary),
            ),
            enabledBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColors.primary),
            ),
            focusedBorder: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              borderSide: BorderSide(color: AppColors.primary),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Pop the current dialog
              Navigator.of(context).pop();
            },
            child: const Text('Cancel',
                style: TextStyle(color: AppColors.primary)),
          ),
          Consumer<DocumentServices>(
            builder: (context, docServices, child) => TextButton(
              onPressed: () {
                if (controller.text.isEmpty) {
                  controller.text = currentName;
                }
                if (!controller.text.endsWith('.pdf')) {
                  controller.text += '.pdf';
                }
                docServices.renameFile(context, imagePath, controller.text);

                Navigator.of(context).pop();
                isPop ? Navigator.of(context).pop() : null;
              },
              child: const Text('Rename',
                  style: TextStyle(color: AppColors.primary)),
            ),
          ),
        ],
      ),
    );
  }
}
