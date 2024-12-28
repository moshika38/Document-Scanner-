import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/color.dart';

class DocCard extends StatelessWidget {
  const DocCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        title: Text(
          'Document Name',
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: Colors.grey[600]),
        ),
        subtitle: Text(
          'Date: ${DateTime.now().toString().split(' ')[0]}',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
            color: AppColors.descriptionText,
            size: 32,
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
