import 'package:app_foody/common/navigation/navigation_service.dart';
import 'package:app_foody/di/di.dart';
import 'package:app_foody/src/module/authentication/domain/service/authentication_repository.dart';
import 'package:app_foody/src/module/authentication/presentation/sign_in/sign_in_screen.dart';
import 'package:app_foody/src/module/home/home_screen.dart';
import 'package:app_foody/src/module/widget/app_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  State<AuthenticationScreen> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final ValueNotifier<bool> loading = ValueNotifier<bool>(true);

  bool isSignIn = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => initData());
  }

  void initData() async {
    if(FirebaseAuth.instance.currentUser != null) {
      appUser = await getIt<AuthenticationRepository>().getUser();
      setState(() {
        isSignIn = false;
      });
    }
    loading.value = false;

  }

  @override
  Widget build(BuildContext context) {
    return AppWidget(
      child: Material(
        color: Colors.transparent,
        child: ValueListenableBuilder(
          valueListenable: loading,
          builder: (_, __, ___) {
            if(loading.value) {
              return const Center(
              child: AppIndicator(size: 60),
            );
            }

            return isSignIn ? const SignInScreen() : const HomeScreen();
          },
        ),
      ),
    );
  }
}
