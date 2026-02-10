import 'package:flutter/material.dart';
import '../../../../core/theme/app_pallete.dart';

class CalendarMonthSelector extends StatelessWidget {
  const CalendarMonthSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chevron_left, color: AppPallete.textGrey),
          ),
          const Row(
            children: [
              Text(
                'Agustus 2025',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: AppPallete.primaryBlue,
                ),
              ),
              SizedBox(width: 4),
              Icon(Icons.keyboard_arrow_down, color: AppPallete.primaryBlue),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.chevron_right, color: AppPallete.textGrey),
          ),
        ],
      ),
    );
  }
}
