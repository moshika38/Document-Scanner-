import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/color.dart';

class Rename {
  static renameDoc(BuildContext context) async {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          title: Text('Rename Document',
              style: Theme.of(context).textTheme.bodyMedium),
          content: TextField(
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
              onPressed: () => Navigator.pop(context),
              child: Text('Cancel',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColors.primary)),
            ),
            TextButton(
              onPressed: () {
                // rename function
              },
              child: Text('Rename',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: AppColors.primary)),
            ),
          ],
        );
      },
    );
  }
}
