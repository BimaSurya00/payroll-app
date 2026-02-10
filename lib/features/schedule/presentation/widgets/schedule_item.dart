import 'package:flutter/material.dart';
import '../../../../core/theme/app_pallete.dart';

class ScheduleItem extends StatelessWidget {
  final String day;
  final String date;
  final String status;
  final String time;
  final bool isToday;

  const ScheduleItem({
    super.key,
    required this.day,
    required this.date,
    required this.status,
    required this.time,
    this.isToday = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: isToday ? Border.all(color: AppPallete.primaryBlue, width: 1.5) : null,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              // Day Box
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: isToday ? AppPallete.primaryBlue.withOpacity(0.1) : AppPallete.backgroundGrey,
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  day,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isToday ? AppPallete.primaryBlue : AppPallete.textGrey,
                    fontSize: 14,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Date and Status
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      date,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: AppPallete.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        status,
                        style: const TextStyle(
                          color: AppPallete.green,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Time
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: AppPallete.primaryBlue.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  time,
                  style: const TextStyle(
                    color: AppPallete.primaryBlue,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (isToday)
          Positioned(
            right: 24,
            top: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: const BoxDecoration(
                color: AppPallete.primaryBlue,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15), 
                  bottomLeft: Radius.circular(12),
                ),
                // To match "Hari Ini" badge style in the image exactly usually requires
                // precise positioning or specific shape.
                // The image shows it strictly inside the border.
                // Actually the image shows it on the TOP RIGHT inside the card.
              ),
              child: const Text(
                'Hari Ini',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
