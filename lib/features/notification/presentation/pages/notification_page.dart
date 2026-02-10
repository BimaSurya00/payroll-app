import 'package:flutter/material.dart';
import '../../../../core/theme/app_pallete.dart';
import '../widgets/notification_header.dart';
import '../widgets/notification_item.dart';
import '../widgets/date_divider.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const NotificationHeader(),
            const DateDivider(label: 'Hari ini'),
            const NotificationItem(
              title: 'Pengajuan Cuti Disetujui',
              message: 'Selamat! Pengajuan cuti telah disetujui.',
              time: '08:35',
              isUnread: true,
            ),
             // Example of another notification
            const NotificationItem(
              title: 'Laporan Kehadiran',
              message: 'Laporan kehadiran bulan ini sudah tersedia.',
              time: 'Kemarin',
            ),
             const SizedBox(height: 80),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppPallete.primaryBlue,
        child: const Icon(Icons.playlist_add_check, color: Colors.white),
        // Design shows a specific rounded square button with a check-mail icon
        // Let's adjust shape
         shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)
          ),
      ),
    );
  }
}
