import 'package:flutter/material.dart';
import '../../../../core/theme/app_pallete.dart';
import '../widgets/check_in_header.dart';
import '../widgets/location_card.dart';

class CheckInPage extends StatelessWidget {
  const CheckInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Background with Content
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(bottom: 40),
              decoration: const BoxDecoration(
                color: AppPallete.primaryBlue,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF0077C2), Color(0xFF005b9f)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: const CheckInHeader(
                    time: '07:30', // Mock time
                    date: 'Senin, 28 Agustus 2025',
                    shift: 'Shift Pagi: 08:00 - 17:00',
                  ),
                ),
              ),
            ),

            // Location Card - Moved out of Stack for cleaner flow
            Transform.translate(
              offset: const Offset(0, -30),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: LocationCard(
                  locationName: 'PT. Teknologi Masa Depan, Jakarta Selatan',
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Dual Action Buttons
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  Expanded(
                    child: _buildActionButton(
                      context,
                      label: 'Absen Masuk',
                      icon: Icons.login,
                      color: AppPallete.green,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Absen Masuk Berhasil!'),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildActionButton(
                      context,
                      label: 'Absen Pulang',
                      icon: Icons.logout,
                      color: AppPallete.red, // Using red/orange for logout
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Absen Pulang Berhasil!'),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Pastikan lokasi anda sesuai saat melakukan absen',
              textAlign: TextAlign.center,
              style: TextStyle(color: AppPallete.textGrey, fontSize: 12),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required String label,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.2),
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
          border: Border.all(color: color.withOpacity(0.1), width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(height: 12),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
