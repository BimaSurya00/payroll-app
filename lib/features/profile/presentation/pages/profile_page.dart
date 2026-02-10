import 'package:flutter/material.dart';
import '../../../../core/theme/app_pallete.dart';
import '../widgets/profile_header.dart';
import '../widgets/profile_info_card.dart';
import '../widgets/employment_info_card.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 0; // 0: Pribadi, 1: Pekerjaan, 2: Pengaturan

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const ProfileHeader(),
            const SizedBox(height: 20),
            // Custom Tab Bar Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildTabItem('Pribadi', 0),
                  _buildTabItem('Pekerjaan', 1),
                  _buildTabItem('Pengaturan', 2),
                ],
              ),
            ),
            const Divider(color: Colors.grey, thickness: 0.5, height: 1),

            // Content Switching
            _buildContent(),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    switch (_selectedIndex) {
      case 0:
        return const ProfileInfoCard();
      case 1:
        return const EmploymentInfoCard();
      case 2:
        // Placeholder for Settings
        return const Padding(
          padding: EdgeInsets.all(40.0),
          child: Center(
            child: Text(
              'Pengaturan belum tersedia',
              style: TextStyle(color: AppPallete.textGrey),
            ),
          ),
        );
      default:
        return const ProfileInfoCard();
    }
  }

  Widget _buildTabItem(String label, int index) {
    bool isActive = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              color: isActive ? AppPallete.primaryBlue : AppPallete.textGrey,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 3,
            width: 60,
            color: isActive ? AppPallete.primaryBlue : Colors.transparent,
          ),
        ],
      ),
    );
  }
}
