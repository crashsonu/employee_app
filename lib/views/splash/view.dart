// All Flutter Built-in Imports Here.
import 'dart:async';
import 'package:flutter/material.dart';

// All Custom Imports Here.
import 'package:go_router/go_router.dart';

// All Native Imports Here.
import 'package:employee_app/constants/colors.dart';
import 'package:employee_app/constants/texts.dart';
import 'package:employee_app/network/router/names.dart';

// All Attributes or Constants Here.

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<Offset>(
      begin: const Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.forward();

    Timer(const Duration(seconds: 4),
        () => GoRouter.of(context).pushReplacementNamed(AppRoute.home));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryColor,
        child: Center(
          child: SlideTransition(
              position: _animation,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 200, child: Image.asset('assets/splash.png')),
                  const SizedBox(height: 20),
                  const AppText(
                    text: 'MyEmployee',
                    color: Colors.white,
                    textSize: 30,
                    bold: true,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
