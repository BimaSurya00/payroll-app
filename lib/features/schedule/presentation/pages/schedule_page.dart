import 'package:flutter/material.dart';
import 'package:payroll_app/core/theme/app_pallete.dart';
import '../widgets/schedule_header.dart';
import '../widgets/calendar_month_selector.dart';
import '../widgets/schedule_item.dart';

class SchedulePage extends StatelessWidget {
  const SchedulePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Section
            // We use a SizedBox to control the height because ScheduleHeader uses Stack
            const SizedBox(
              height: 320, // Enough space for background + floating card
              child: ScheduleHeader(),
            ),

            // Month Selector
            const CalendarMonthSelector(),

            // Schedule List
            const ScheduleItem(
              day: 'Sel',
              date: '26 Agu 2025',
              status: 'Regular',
              time: '08:00 - 17:00',
            ),
            const ScheduleItem(
              day: 'Rab',
              date: '27 Agu 2025',
              status: 'Regular',
              time: '08:00 - 17:00',
            ),
            const ScheduleItem(
              day: 'Kam',
              date: '28 Agu 2025',
              status: 'Regular',
              time: '08:00 - 17:00',
              isToday: true,
            ),
            const ScheduleItem(
              day: 'Jum',
              date: '29 Agu 2025',
              status: 'Regular',
              time: '08:00 - 17:00',
            ),

            const SizedBox(height: 80), // Bottom padding
          ],
        ),
      ),
    );
  }
}
