import 'package:flutter/material.dart';
import 'profile_info_item.dart';
import '../../../../core/theme/app_pallete.dart';

class EmploymentInfoCard extends StatelessWidget {
  const EmploymentInfoCard({super.key});

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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Informasi Pekerjaan',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppPallete.primaryBlue,
            ),
          ),
          SizedBox(height: 24),
          ProfileInfoItem(
            icon: Icons.work_outline,
            label: 'Posisi',
            value: 'Senior Mobile Developer',
            showEdit: false,
          ),
          ProfileInfoItem(
            icon: Icons.business_outlined,
            label: 'Divisi',
            value: 'Information Technology',
            showEdit: false,
          ),
          ProfileInfoItem(
            icon: Icons.calendar_today_outlined,
            label: 'Tanggal Bergabung',
            value: '10 Januari 2022',
            showEdit: false,
          ),
          ProfileInfoItem(
            icon: Icons.verified_user_outlined,
            label: 'Status Karyawan',
            value: 'Tetap (Full-time)',
            showEdit: false,
          ),
          ProfileInfoItem(
            icon: Icons.person_outline,
            label: 'Atasan Langsung',
            value: 'Budi Santoso',
            showEdit: false,
          ),
        ],
      ),
    );
  }
}
