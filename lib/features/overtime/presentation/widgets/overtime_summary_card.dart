import 'package:flutter/material.dart';
import '../../../../core/theme/app_pallete.dart';

class OvertimeSummaryCard extends StatelessWidget {
  final String hours;
  final String earnings;

  const OvertimeSummaryCard({
    super.key,
    required this.hours,
    required this.earnings,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatColumn('Total Jam', hours, Icons.access_time_filled, AppPallete.primaryBlue),
          Container(height: 40, width: 1, color: Colors.grey[200]),
          _buildStatColumn('Estimasi', earnings, Icons.monetization_on, AppPallete.green),
        ],
      ),
    );
  }

  Widget _buildStatColumn(String label, String value, IconData icon, Color color) {
    return Column(
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 16),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                color: AppPallete.textGrey,
                fontSize: 12,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
