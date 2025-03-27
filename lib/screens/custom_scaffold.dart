import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key, this.child});
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Image.asset(
            'asset/thetaapp.jpg',
            fit: BoxFit.cover,
            width: 500,
            height: 900,
          ),
          SafeArea(
            child: child!,
          ),
        ],
      ),
    );
  }
}
