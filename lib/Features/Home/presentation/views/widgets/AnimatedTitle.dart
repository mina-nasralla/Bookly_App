
import 'package:flutter/material.dart';

class AnimatedTitle extends StatefulWidget implements PreferredSizeWidget {
  const AnimatedTitle({super.key});

  @override
  _AnimatedTitleState createState() => _AnimatedTitleState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AnimatedTitleState extends State<AnimatedTitle> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animationLeft;
  late Animation<Offset> _animationRight;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _animationLeft = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.0, 0.1), // Slightly move down for animation effect
    ).animate(_controller);
    _animationRight = Tween<Offset>(
      begin: const Offset(0.0, 0.0),
      end: const Offset(0.0, -0.1), // Slightly move up for opposite movement
    ).animate(_controller);
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'B',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 4),
            SlideTransition(
              position: _animationLeft,
              child: const Text(
                'O',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SlideTransition(
              position: _animationRight,
              child: const Text(
                'O',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(width: 4),
            const Text(
              'KLY',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],

        );
      },
    );
  }
}