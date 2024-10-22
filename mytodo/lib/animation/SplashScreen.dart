import 'package:flutter/material.dart';
import'package:mytodo/TODO/TodoPage.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Delay 3 seconds and navigate to the main Todo page
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const Todo()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent, 
      body: Center(
        child: TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: 1), 
          duration: const Duration(seconds: 2),
          builder: (context, double value, child) {
            return Transform.scale(
              scale: value,
              child: child,
            );
          },
          child: const Text(
            'My Todos', 
            style: TextStyle(
              fontSize: 40, 
              fontWeight: FontWeight.bold, 
              color: Colors.white, 
            ),
          ),
        ),
      ),
    );
  }
}