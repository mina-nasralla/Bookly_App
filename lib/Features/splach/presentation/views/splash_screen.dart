import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:booklyapp/Core/utilites/assets.dart';
import 'package:booklyapp/Features/Home/presentation/views/Home.dart';
import 'package:booklyapp/constant.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
          splash: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: LottieBuilder.asset(AssetsData.splash2)),
              const Text('Bookly App',style: TextStyle(fontSize: 35),)
            ],
          ),
          backgroundColor: Kprimarycolor,
          duration: 5000,
          splashIconSize: 800,
          animationDuration: const Duration(seconds: 2), nextScreen: const Home(),
    );
  }
}
