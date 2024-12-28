import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/color.dart';
import 'package:flutter_application_1/features/home/widget/popup_window.dart';

class Headline extends StatefulWidget {
  final String title;
  final bool isIcon;
  const Headline({
    super.key,
    required this.title,
    required this.isIcon,
  });

  @override
  State<Headline> createState() => _HeadlineState();
}

class _HeadlineState extends State<Headline> {


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.titleText,
              ),
        ),
        widget.isIcon
            ? IconButton(
                icon: const Icon(
                  Icons.create_new_folder,
                  size: 32,
                ),
                onPressed: () {
                  PopupWindow.addFolder(context);
                },
              )
            : TextButton(
                onPressed: () {},
                child: Text(
                  'Clear All',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ),
      ],
    );
  }
}
