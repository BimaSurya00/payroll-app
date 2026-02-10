import 'package:flutter/material.dart';
import '../../../../core/theme/app_pallete.dart';

class LeaveHistoryList extends StatelessWidget {
  const LeaveHistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
       shrinkWrap: true,
       physics: const NeverScrollableScrollPhysics(),
       padding: const EdgeInsets.symmetric(horizontal: 24),
       children: const [
         Text(
           'Riwayat Pengajuan',
           style: TextStyle(
             fontSize: 18,
             fontWeight: FontWeight.bold,
             color: AppPallete.textBlack,
           ),
         ),
         SizedBox(height: 16),
         _LeaveHistoryItem(
           color: AppPallete.green,
           dateRange: '27 Aug 2025 - 28 Aug 2025',
           status: 'Disetujui',
           type: 'Cuti Tahunan',
           reason: 'Acara Keluarga',
           statusColor: AppPallete.green,
         ),
         _LeaveHistoryItem(
           color: AppPallete.yellow,
           dateRange: '16 Jul 2025 - 16 Jul 2025',
           status: 'Menunggu',
           type: 'Cuti Sakit',
           reason: 'cuti sakit, kepala',
           statusColor: AppPallete.yellow,
           isLast: true,
         ),
       ],
    );
  }
}

class _LeaveHistoryItem extends StatelessWidget {
  final Color color;
  final String dateRange;
  final String status;
  final String type;
  final String reason;
  final Color statusColor;
  final bool isLast;

  const _LeaveHistoryItem({
    required this.color,
    required this.dateRange,
    required this.status,
    required this.type,
    required this.reason,
    required this.statusColor,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(
                    width: 2,
                    color: Colors.grey[300],
                    margin: const EdgeInsets.symmetric(vertical: 4),
                  ),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(Icons.calendar_today, size: 14, color: AppPallete.textBlack),
                            const SizedBox(width: 8),
                            Text(
                              dateRange,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: statusColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                status == 'Disetujui' ? Icons.check_circle_outline : Icons.access_time, 
                                size: 12, 
                                color: statusColor,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                status,
                                style: TextStyle(
                                  color: statusColor,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        type,
                        style: const TextStyle(
                          color: AppPallete.primaryBlue,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      reason,
                      style: const TextStyle(
                        color: AppPallete.textGrey,
                        fontSize: 14,
                      ),
                    ),
                    if (status == 'Menunggu') ...[
                      const SizedBox(height: 16),
                      const Divider(thickness: 0.5),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.attach_file, size: 16, color: AppPallete.textGrey),
                              const SizedBox(width: 4),
                              const Text(
                                'Lampiran',
                                style: TextStyle(
                                  color: AppPallete.textGrey,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            'Lihat',
                            style: TextStyle(
                              color: AppPallete.primaryBlue,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ]
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
