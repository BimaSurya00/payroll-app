import 'package:flutter/material.dart';
import 'profile_info_item.dart';
import '../../../../core/theme/app_pallete.dart';

class EmploymentInfoCard extends StatelessWidget {
  final String? position;
  final String? division;
  final String? joiningDate;
  final String? employmentStatus;
  final String? supervisor;

  const EmploymentInfoCard({
    super.key,
    this.position,
    this.division,
    this.joiningDate,
    this.employmentStatus,
    this.supervisor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      padding: const EdgeInsets.all(24),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Informasi Pekerjaan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppPallete.primaryBlue,
            ),
          ),
          const SizedBox(height: 24),
          ProfileInfoItem(
            icon: Icons.work_outline,
            label: 'Posisi',
            value: position ?? 'N/A',
            showEdit: false,
          ),
          ProfileInfoItem(
            icon: Icons.business_outlined,
            label: 'Divisi',
            value: division ?? 'N/A',
            showEdit: false,
          ),
          ProfileInfoItem(
            icon: Icons.calendar_today_outlined,
            label: 'Tanggal Bergabung',
            value: joiningDate ?? 'N/A',
            showEdit: false,
          ),
          ProfileInfoItem(
            icon: Icons.verified_user_outlined,
            label: 'Status Karyawan',
            value: employmentStatus ?? 'N/A',
            showEdit: false,
          ),
          ProfileInfoItem(
            icon: Icons.person_outline,
            label: 'Atasan Langsung',
            value: supervisor ?? 'N/A',
            showEdit: false,
          ),
        ],
      ),
    );
  }
}
