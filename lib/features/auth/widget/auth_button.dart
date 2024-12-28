import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/color.dart';

class AuthButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isOutlined;

  const AuthButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isOutlined ? Colors.transparent : AppColors.primary,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: isOutlined ? Border.all(color: AppColors.primary) : null,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              label != "Continue with Google"
                  ? Icon(
                      icon,
                      color: isOutlined ? AppColors.primary : Colors.white,
                      size: 24,
                    )
                  : SizedBox(
                      width: 22,
                      height: 22,
                      child: Image.asset(
                        "assets/login/google.png",
                        fit: BoxFit.fitHeight,
                        // color: Colors.white,
                      )),
              const SizedBox(width: 12),
              Text(
                label,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isOutlined ? AppColors.primary : Colors.white,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
