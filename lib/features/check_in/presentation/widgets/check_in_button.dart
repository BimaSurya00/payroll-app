import 'package:flutter/material.dart';
import '../../../../core/theme/app_pallete.dart';

class CheckInButton extends StatelessWidget {
  final VoidCallback onTap;

  const CheckInButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(100),
      child: Container(
        height: 180,
        width: 180,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0077C2),
              Color(0xFF005b9f),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: AppPallete.primaryBlue.withOpacity(0.3),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.fingerprint, size: 80, color: Colors.white),
            SizedBox(height: 10),
            Text(
              'Absen Masuk',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
