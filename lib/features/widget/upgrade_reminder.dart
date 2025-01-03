import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/color.dart';
import 'package:flutter_application_1/features/widget/payment.dart';

class UpgradeReminder {
  void showPopup(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.star, color: AppColors.primary, size: 50),
            const SizedBox(height: 10),
            Text(
              'Upgrade to premium',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black,
                  ),
            ),
            const SizedBox(height: 10),
            Text(
              'Your daily limit of 10 scans has been reached. Upgrade to premium to continue scanning.\n\nOnly \$15, one-time payment.',
              style: Theme.of(context).textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Container(
              width: 120,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.primary,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Payment().showPopup(context);
                },
                child: Text(
                  'Upgrade',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Maybe later',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.primary,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
