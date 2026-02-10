import 'package:flutter/material.dart';
import 'package:payroll_app/features/notification/presentation/pages/notification_page.dart';
import 'package:payroll_app/features/profile/presentation/pages/profile_page.dart';
import 'package:payroll_app/features/schedule/presentation/pages/schedule_page.dart';
import '../../../../features/check_in/presentation/pages/check_in_page.dart';
import '../../../../core/theme/app_pallete.dart';
import 'home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex =
      0; // Default to 'Absen' (Center) or Home? Design shows 'Absen' is big button.
  // Actually, standard bottoms usually have 0 as start.
  // Let's assume indices: 0=Beranda, 1=Notifikasi, 2=Absen(Center), 3=Jadwal, 4=Profil

  // However, the design shows "Beranda", "Notifikasi", "Absen" (Floated), "Jadwal", "Profil".
  // The user asked for "Home" implementation.
  // Let's default to 0 (Beranda) being the Home Page we just built.

  final List<Widget> _pages = [
    const HomePage(),
    const NotificationPage(),
    const CheckInPage(),
    const SchedulePage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallete.backgroundGrey,
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppPallete.primaryBlue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'Notifikasi',
          ),
          BottomNavigationBarItem(
            icon: SizedBox.shrink(), // Empty for the floating button
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Jadwal',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profil',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _currentIndex = 2;
          });
        },
        backgroundColor: AppPallete.primaryBlue,
        shape: const CircleBorder(),
        child: const Icon(Icons.fingerprint, color: Colors.white, size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
