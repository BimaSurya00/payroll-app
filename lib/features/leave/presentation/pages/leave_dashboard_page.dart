import 'package:flutter/material.dart';
import '../../../../core/theme/app_pallete.dart';
import '../widgets/leave_action_button.dart';
import '../widgets/leave_balance_card.dart';
import '../widgets/leave_history_list.dart';

class LeaveDashboardPage extends StatelessWidget {
  const LeaveDashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundGrey,
      appBar: AppBar(
        backgroundColor: AppPallete.primaryBlue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Pengajuan Cuti',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LeaveActionButton(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.4,
                children: const [
                  LeaveBalanceCard(
                    title: 'Cuti Tahunan',
                    value: '10/12',
                    subtitle: 'Tersisa',
                    themeColor: AppPallete.primaryBlue,
                    icon: Icons.calendar_today,
                    showProgress: true,
                    progress: 0.8,
                  ),
                  LeaveBalanceCard(
                    title: 'Cuti Sakit',
                    value: '1',
                    subtitle: 'Digunakan',
                    themeColor: AppPallete.red,
                    icon: Icons.local_hospital_outlined,
                  ),
                  LeaveBalanceCard(
                    title: 'Cuti Penting',
                    value: '0',
                    subtitle: 'Digunakan',
                    themeColor: AppPallete.yellow,
                    icon: Icons.priority_high,
                  ),
                  LeaveBalanceCard(
                    title: 'Cuti Lainnya',
                    value: '0',
                    subtitle: 'Digunakan',
                    themeColor: AppPallete.green,
                    icon: Icons.more_horiz,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            const LeaveHistoryList(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
