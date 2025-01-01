import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/color.dart';
import 'package:flutter_application_1/features/widget/delete_popup.dart';
import 'package:flutter_application_1/features/widget/edit_popup.dart';
import 'package:flutter_application_1/models/doc_model.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class DocCard extends StatefulWidget {
  final DocModel docModel;
  const DocCard({
    super.key,
    required this.docModel,
  });

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
                ),
                child: PDFView(
                  filePath: widget.docModel.path,
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
                          widget.docModel.name,
                          style: Theme.of(context).textTheme.bodyMedium,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(Icons.file_present,
                            size: 16, color: AppColors.descriptionText),
                        const SizedBox(width: 4),
                        Text(
                          'PDF ',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: AppColors.descriptionText,
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.docModel.size,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: AppColors.descriptionText,
                          ),
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
                            onPressed: () {
                              RenamePopup().rename(context, widget.docModel.path, false, widget.docModel.name);
                            },
                            icon: const Icon(
                              Icons.edit,
                              size: 18,
                              color: AppColors.primary,
                            )),
                        IconButton(
                            onPressed: () {
                              DeletePopup()
                                  .deleteImage(context, widget.docModel.path, false);
                            },
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
