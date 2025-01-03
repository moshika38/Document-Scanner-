import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/color.dart';
import 'package:flutter_application_1/features/home/provider/document_provider.dart';
import 'package:provider/provider.dart';

class DeletePopup {
  void deleteImage(BuildContext context, String imagePath, bool isPop) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Text(
              'Delete Document',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black,
                  ),
            ),
            SizedBox(height: 16.0),
            Text('Are you sure you want to delete this Document?',
                style: Theme.of(context).textTheme.bodyMedium),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    // Pop the current bottom sheet
                    Navigator.of(context).pop();
                  },
                  child: const Text('Cancel',
                      style: TextStyle(color: AppColors.primary)),
                ),
                Consumer<DocumentServices>(
                  builder: (context, docServices, child) => TextButton(
                    onPressed: () {
                      // Delete the image and then pop the bottom sheet
                      docServices.deletePdf(context, imagePath);

                      Navigator.of(context).pop();
                      isPop ? Navigator.of(context).pop() : null;
                    },
                    child: const Text('Delete',
                        style: TextStyle(color: AppColors.primary)),
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
