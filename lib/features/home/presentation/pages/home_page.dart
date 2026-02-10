import 'package:flutter/material.dart';
import '../widgets/home_header.dart';
import '../widgets/attendance_card.dart';
import '../widgets/menu_grid.dart';
import '../widgets/recent_history.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Actually, let's try a cleaner approach without a giant Stack for everything.
          // We can put the Header and the Card in a Stack.
          SizedBox(
            height: 310, // Height of header + overlap part of card
            child: Stack(
              children: [
                const HomeHeader(),
                Positioned(
                  top: 170, // Adjust based on Header height
                  left: 0,
                  right: 0,
                  child: const AttendanceCard(),
                ),
              ],
            ),
          ),

          const MenuGrid(),
          const SizedBox(height: 10),
          const RecentHistory(),
          const SizedBox(height: 80), // Setup for bottom nav spacing if needed
        ],
      ),
    );
  }
}
