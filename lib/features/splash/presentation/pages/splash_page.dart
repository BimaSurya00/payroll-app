import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../features/auth/presentation/pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;
  
  final String _fullText = 'Payroll App';
  String _displayedText = '';
  Timer? _typingTimer;

  @override
  void initState() {
    super.initState();

    // Initialize animation controller
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Fade in animation
    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.6, curve: Curves.easeIn),
      ),
    );

    // Scale up animation with a subtle "pop" effect
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOutBack,
      ),
    );

    // Start the animation
    _controller.forward();
    
    // Start typing animation after a small delay
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) _startTypingAnimation();
    });

    // Navigate to Login Page after 3.5 seconds (slightly longer for typing)
    Timer(const Duration(milliseconds: 3500), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }
    });
  }

  void _startTypingAnimation() {
    int index = 0;
    _typingTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (index < _fullText.length) {
        if (mounted) {
          setState(() {
            _displayedText = _fullText.substring(0, index + 1);
          });
        }
        index++;
      } else {
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _typingTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Shared color palette with Login Page (can be extracted to a theme later)
    const primaryColor = Color(0xFF2563EB); 

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Center Content: Animated Logo/Icon
            Center(
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: FadeTransition(
                  opacity: _opacityAnimation,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Placeholder for Logo - Using a modern icon
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.grid_view_rounded, // Abstract modern icon
                          size: 64,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Brand Name with Typing Animation
                      Text(
                        _displayedText, 
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1F2937),
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            // Footer: Version or Tagline
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: FadeTransition(
                  opacity: _opacityAnimation,
                  child: const Text(
                    'Empowering MSMEs',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF9CA3AF),
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
