import 'package:app_foody/src/module/admin/admin_screen.dart';
import 'package:app_foody/src/module/authentication/domain/model/user_data.dart';
import 'package:app_foody/src/module/user/user_screen.dart';
import 'package:flutter/material.dart';

AppUser? appUser;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    if (appUser == null) return const SizedBox.shrink();
    return PopScope(
      canPop: false,
      child:
          appUser!.role == 'admin' ? const AdminScreen() : const UserScreen(),
    );
  }
}
