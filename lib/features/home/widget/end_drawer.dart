import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/color.dart';

class EndDrawer extends StatelessWidget {
  const EndDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            Container(
              height: 250,
              width: double.infinity,
              color: AppColors.primary,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const SizedBox(
                        width: 150,
                        height: 150,
                        child: CircularProgressIndicator(
                          value: 0.5,
                          strokeWidth: 10,
                          backgroundColor: Colors.white,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.green,
                            // Colors.red,
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "50%",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(
                                  color: AppColors.buttonText,
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          Text(
                            "10GB/20GB",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: AppColors.buttonText,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Free Plan",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: AppColors.buttonText,
                        ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.storage_outlined, size: 25),
              title: const Text('Storage Management'),
              subtitle: const Text('Manage your files and storage'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium, size: 25),
              title: const Text('Upgrade to Pro'),
              subtitle: const Text('Get unlimited storage'),
              onTap: () {},
            ),
            // ListTile(
            //   leading: const Icon(Icons.folder_outlined, size: 25),
            //   title: const Text('Manage Downloads'),
            //   onTap: () {},
            // ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.security_outlined, size: 25),
              title: const Text('Privacy & Security'),
              onTap: () {},
            ),
            // ListTile(
            //   leading: const Icon(Icons.sync, size: 25),
            //   title: const Text('Auto-sync Settings'),
            //   onTap: () {},
            // ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, size: 25),
              title: const Text('Logout'),
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
