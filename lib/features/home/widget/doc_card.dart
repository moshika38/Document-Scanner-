import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/color.dart';

class DocCard extends StatefulWidget {
  const DocCard({super.key});

  @override
  State<DocCard> createState() => _DocCardState();
}

class _DocCardState extends State<DocCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return // Inside ListView.builder, replace the existing Card with:
        Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              // Document Preview
              Container(
                height: 120,
                width: 100,
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: const DecorationImage(
                    image: NetworkImage('https://picsum.photos/200'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              // Document Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Document ',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            color: AppColors.primary,
                          ),
                          onPressed: () {
                            // Add to favorites
                          },
                        ),
                      ],
                    ),
                    Text(
                      'Scanned on ${DateTime.now().toString().split(' ')[0]}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.file_present,
                            size: 16, color: AppColors.descriptionText),
                        const SizedBox(width: 4),
                        Text(
                          'PDF • 2.3 MB',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.descriptionText,
                                  ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.share,
                              size: 18,
                              color: AppColors.primary,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit,
                              size: 18,
                              color: AppColors.primary,
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.delete,
                              size: 18,
                              color: AppColors.primary,
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Action Buttons
        ],
      ),
    );
  }
}
