import 'package:booklyapp/Features/Home/presentation/views/widgets/AnimatedTitle.dart';
import 'package:booklyapp/Features/Home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: const HomeViewBody(),
    );
  }
}

