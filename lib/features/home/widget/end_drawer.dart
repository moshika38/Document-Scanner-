import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/color.dart';
import 'package:flutter_application_1/features/home/services/path_services.dart';

class EndDrawer extends StatefulWidget {
  const EndDrawer({super.key});

  @override
  State<EndDrawer> createState() => _EndDrawerState();
}

class _EndDrawerState extends State<EndDrawer> {
  String selectedFolderPath = "";
  Future<void> selectFolder() async {
    String? result = await FilePicker.platform.getDirectoryPath();
    if (result != null) {
      PathServices.saveLocation(result);
      setState(() {
        selectedFolderPath = result;
      });
    }
  }

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
              child: _buildFreePlanWidget(),
            ),
            ListTile(
              leading: const Icon(Icons.storage_outlined, size: 25),
              title: const Text('Storage Management'),
              subtitle: const Text('Manage your files and storage'),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.workspace_premium, size: 25),
              title: const Text('Upgrade to premium'),
              subtitle: const Text('Get unlimited scanning'),
              onTap: () {},
            ),
            FutureBuilder(
              future: PathServices.getLocation(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  selectedFolderPath = snapshot.data as String;

                  return ListTile(
                    subtitleTextStyle: Theme.of(context).textTheme.bodySmall,
                    leading: const Icon(Icons.folder_outlined, size: 25),
                    title: const Text('Select Location'),
                    onTap: selectFolder,
                    subtitle: selectedFolderPath.isNotEmpty
                        ? Text(
                            selectedFolderPath,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                        : const Text('Not Selected'),
                  );
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return ListTile(
                    subtitleTextStyle: Theme.of(context).textTheme.bodySmall,
                    leading: const Icon(Icons.folder_outlined, size: 25),
                    title: const Text('Select Location'),
                    subtitle: const Text(
                      "Loading ...",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
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

  Widget _buildFreePlanWidget() {
    return Column(
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
                  "10",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: AppColors.buttonText,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  "Scan(s) left",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.buttonText,
                        fontWeight: FontWeight.bold,
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
    );
  }
}
