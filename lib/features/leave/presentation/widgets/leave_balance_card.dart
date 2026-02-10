import 'package:flutter/material.dart';
import '../../../../core/theme/app_pallete.dart';

class LeaveBalanceCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final Color themeColor;
  final IconData icon;
  final bool showProgress;
  final double progress;

  const LeaveBalanceCard({
    super.key,
    required this.title,
    required this.value,
    this.subtitle = '',
    required this.themeColor,
    required this.icon,
    this.showProgress = false,
    this.progress = 0.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: themeColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: themeColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: themeColor, size: 16),
              ),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: AppPallete.textBlack,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: themeColor,
                ),
              ),
              if (subtitle.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(left: 4, bottom: 2),
                  child: Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppPallete.textGrey,
                    ),
                  ),
                ),
            ],
          ),
          if (showProgress) ...[
             const SizedBox(height: 8),
             LinearProgressIndicator(
               value: progress,
               backgroundColor: themeColor.withOpacity(0.2),
               color: themeColor,
               minHeight: 4,
               borderRadius: BorderRadius.circular(4),
             ),
          ] else if (subtitle.isNotEmpty) 
             Text(
                subtitle, // Show subtitle below if no progress bar (e.g. 'Digunakan')
                style: const TextStyle(
                  fontSize: 12,
                  color: AppPallete.textGrey,
                ),
              ),

        ],
      ),
    );
  }
}
