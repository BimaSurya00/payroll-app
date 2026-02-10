import 'package:flutter/material.dart';
import '../../../../core/theme/app_pallete.dart';
import '../widgets/overtime_summary_card.dart';
import '../widgets/overtime_list_item.dart';
import 'overtime_form_page.dart';

class OvertimePage extends StatelessWidget {
  const OvertimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundGrey,
      appBar: AppBar(
        title: const Text(
          'Lembur',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppPallete.primaryBlue,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Blue Header Extension
            Container(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
              decoration: const BoxDecoration(
                color: AppPallete.primaryBlue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  // Month Selector
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.chevron_left,
                          color: Colors.white70,
                        ),
                      ),
                      const Text(
                        'Agustus 2025',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.chevron_right,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const OvertimeSummaryCard(
                    hours: '12 Jam',
                    earnings: 'Rp 600.000',
                  ),
                ],
              ),
            ),

            // Reusing Action Button (Renaming logic would be ideal in refactor, but strict reuse of widget for now)
            // Or better, creating a specific button or tweaking the text if the widget supports it.
            // LeaveActionButton hardcodes "Ajukan Cuti". Let's create a local one or make generic?
            // User requested "best practice". Recreating a small button here is safer than coupling unless generic.
            const _OvertimeActionButton(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Riwayat Lembur',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppPallete.textBlack,
                    ),
                  ),
                  SizedBox(height: 16),
                  OvertimeListItem(
                    date: 'Senin, 25 Aug 2025',
                    timeRange: '17:00 - 20:00',
                    duration: '3 Jam',
                    reason: 'Menyelesaikan laporan bulanan',
                    status: 'Disetujui',
                    statusColor: AppPallete.green,
                  ),
                  OvertimeListItem(
                    date: 'Selasa, 19 Aug 2025',
                    timeRange: '17:00 - 19:00',
                    duration: '2 Jam',
                    reason: 'Meeting dengan klien',
                    status: 'Menunggu',
                    statusColor: AppPallete.yellow,
                  ),
                  OvertimeListItem(
                    date: 'Jumat, 15 Aug 2025',
                    timeRange: '17:00 - 21:00',
                    duration: '4 Jam',
                    reason: 'Deployment server',
                    status: 'Disetujui',
                    statusColor: AppPallete.green,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}

class _OvertimeActionButton extends StatelessWidget {
  const _OvertimeActionButton();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF0077C2), Color(0xFF0088CC)],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppPallete.primaryBlue.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const OvertimeFormPage()),
            );
          },
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.timer_outlined,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ajukan Lembur',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Formulir pengajuan lembur',
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
