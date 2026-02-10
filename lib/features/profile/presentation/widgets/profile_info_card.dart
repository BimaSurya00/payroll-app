import 'package:flutter/material.dart';
import 'profile_info_item.dart';
import '../../../../core/theme/app_pallete.dart';

class ProfileInfoCard extends StatelessWidget {
  const ProfileInfoCard({super.key});

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
            'Informasi Pribadi',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppPallete.primaryBlue,
            ),
          ),
          SizedBox(height: 24),
          ProfileInfoItem(
            icon: Icons.badge_outlined,
            label: 'ID Pegawai',
            value: '144856 344 8899',
            showEdit: false,
          ),
          ProfileInfoItem(
            icon: Icons.email_outlined,
            label: 'Email',
            value: 'lukmanhakim@gmail.com',
          ),
          ProfileInfoItem(
            icon: Icons.phone_outlined,
            label: 'No. Telepon',
            value: '089608780861',
          ),
          ProfileInfoItem(
            icon: Icons.location_on_outlined,
            label: 'Alamat',
            value: 'Jalan durian Blok E-176, sinarsari, kab. Bogor, Jawa Barat',
          ),
        ],
      ),
    );
  }
}
