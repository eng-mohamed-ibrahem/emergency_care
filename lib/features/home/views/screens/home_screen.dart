import 'package:emergeny_care/config/navigation/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFfC4C4C4).withAlpha(20),
      body: Center(
        child: InkWell(
          onTap: () {
            context.goNamed(Routes.registerVehicle.name);
          },
          child: Text("Home Screen"),
        ),
      ),
    );
  }
}
