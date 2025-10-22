import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fitnessapp/core/constant/approut.dart';
import 'package:fitnessapp/core/servieces/servicess.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _backgroundController;
  late AnimationController _iconPulseController;
  late AnimationController _fadeScaleController;

  late Animation<Color?> _backgroundGradient1;
  late Animation<Color?> _backgroundGradient2;
  late Animation<double> _iconPulseAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    Services s = Get.find();

    super.initState();

    // Background gradient animation
    _backgroundController = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    )..repeat(reverse: true);

    _backgroundGradient1 =
        ColorTween(begin: Colors.deepPurple[300], end: Colors.deepPurple[200])
            .animate(CurvedAnimation(
                parent: _backgroundController, curve: Curves.easeInOut));

    _backgroundGradient2 = ColorTween(
      begin: Colors.deepPurple[300],
      end: Colors.deepPurple[200],
    ).animate(CurvedAnimation(
        parent: _backgroundController, curve: Curves.easeInOut));

    // Icon pulse animation
    _iconPulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _iconPulseAnimation = Tween<double>(begin: 1.0, end: 1.1).animate(
      CurvedAnimation(parent: _iconPulseController, curve: Curves.easeInOut),
    );

    // Fade and scale animation for text and icon entrance
    _fadeScaleController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _fadeScaleController, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.85, end: 1.0).animate(
      CurvedAnimation(parent: _fadeScaleController, curve: Curves.easeOutBack),
    );

    _fadeScaleController.forward();

    // ✅ بعد 4 ثواني ننتقل لراوت "/redirect" يلي فيه الـ middleware
    Future.delayed(const Duration(seconds: 4), () {
      if (s.shared.getString("step") == null) {
        s.shared.setString("step", "1");
      }
      Get.offAllNamed(Approut.red);
    });
  }

  @override
  void dispose() {
    _backgroundController.dispose();
    _iconPulseController.dispose();
    _fadeScaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textShadow = [
      Shadow(
        offset: const Offset(0, 1),
        blurRadius: 3.0,
        color: Colors.black.withOpacity(0.3),
      ),
    ];

    return AnimatedBuilder(
      animation: _backgroundController,
      builder: (context, child) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  _backgroundGradient1.value ??
                      const Color.fromARGB(255, 186, 104, 200),
                  _backgroundGradient2.value ??
                      const Color.fromARGB(255, 206, 147, 216)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            alignment: Alignment.center,
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: ScaleTransition(
                scale: _scaleAnimation,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ScaleTransition(
                      scale: _iconPulseAnimation,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withOpacity(0.6),
                              spreadRadius: 8,
                              blurRadius: 15,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.fitness_center,
                          size: 110,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 28),
                    Text(
                      'Fitness Pro',
                      style: TextStyle(
                        fontSize: 38,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        letterSpacing: 3,
                        shadows: textShadow,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      'Your Personal Trainer',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                        fontStyle: FontStyle.italic,
                        shadows: textShadow,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
