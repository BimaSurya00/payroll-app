import 'package:flutter/material.dart';
import 'profile_info_item.dart';
import '../../../../core/theme/app_pallete.dart';

class ProfileInfoCard extends StatelessWidget {
  final String? id;
  final String? email;
  final String? phone;
  final String? address;

  const ProfileInfoCard({
    super.key,
    this.id,
    this.email,
    this.phone,
    this.address,
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
            'Informasi Pribadi',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppPallete.primaryBlue,
            ),
          ),
          const SizedBox(height: 24),
          ProfileInfoItem(
            icon: Icons.badge_outlined,
            label: 'ID Pegawai',
            value: id ?? 'N/A',
            showEdit: false,
          ),
          ProfileInfoItem(
            icon: Icons.email_outlined,
            label: 'Email',
            value: email ?? 'N/A',
          ),
          ProfileInfoItem(
            icon: Icons.phone_outlined,
            label: 'No. Telepon',
            value: phone ?? 'N/A',
          ),
          ProfileInfoItem(
            icon: Icons.location_on_outlined,
            label: 'Alamat',
            value: address ?? 'N/A',
          ),
        ],
      ),
    );
  }
}
