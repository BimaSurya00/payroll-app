import 'package:flutter/material.dart';
import '../../../../core/theme/app_pallete.dart';
import '../widgets/attendance_summary_card.dart';
import '../widgets/attendance_list_item.dart';

class AttendancePage extends StatelessWidget {
  const AttendancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundGrey,
      appBar: AppBar(
        title: const Text('Kehadiran', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: AppPallete.primaryBlue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_month, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Header with Stats
          Container(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
            decoration: const BoxDecoration(
              color: AppPallete.primaryBlue,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                // Month Selector (Simple Text for now)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){}, icon: const Icon(Icons.chevron_left, color: Colors.white70)),
                    const Text(
                      'Agustus 2025',
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.chevron_right, color: Colors.white70)),
                  ],
                ),
                const SizedBox(height: 10),
                // Stats Grid
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 2.1,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    AttendanceSummaryCard(
                      label: 'Hadir',
                      count: '24',
                      color: AppPallete.green,
                      icon: Icons.check_circle_outline,
                    ),
                    AttendanceSummaryCard(
                      label: 'Terlambat',
                      count: '2',
                      color: Color(0xFFFF9800), // Orange
                      icon: Icons.access_time, // Replaced history_toggle_off with standard icon
                    ),
                    AttendanceSummaryCard(
                      label: 'Izin/Cuti',
                      count: '1',
                      color: AppPallete.primaryBlue,
                      icon: Icons.assignment_outlined,
                    ),
                    AttendanceSummaryCard(
                      label: 'Alpha',
                      count: '0',
                      color: AppPallete.red,
                      icon: Icons.cancel_outlined,
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: const [
                Text(
                  'Riwayat Kehadiran',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                SizedBox(height: 16),
                AttendanceListItem(
                  date: '28',
                  day: 'Kam',
                  timeIn: '07:55',
                  timeOut: '17:05',
                  status: 'Tepat Waktu',
                  statusColor: AppPallete.green,
                ),
                AttendanceListItem(
                  date: '27',
                  day: 'Rab',
                  timeIn: '08:15',
                  timeOut: '17:00',
                  status: 'Telat 15m',
                  statusColor: Color(0xFFFF9800),
                ),
                AttendanceListItem(
                  date: '26',
                  day: 'Sel',
                  timeIn: '07:50',
                  timeOut: '17:10',
                  status: 'Tepat Waktu',
                  statusColor: AppPallete.green,
                ),
                AttendanceListItem(
                  date: '25',
                  day: 'Sen',
                  timeIn: '08:00',
                  timeOut: '17:00',
                  status: 'Tepat Waktu',
                  statusColor: AppPallete.green,
                ),
                 AttendanceListItem(
                  date: '22',
                  day: 'Jum',
                  timeIn: '-',
                  timeOut: '-',
                  status: 'Sakit',
                  statusColor: AppPallete.primaryBlue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
