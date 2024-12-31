import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/color.dart';

class Headline extends StatefulWidget {
  final String title;

  const Headline({
    super.key,
    required this.title,
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
        TextButton(
          onPressed: () {},
          child: Text(
            "See all",
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
