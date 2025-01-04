import 'package:app_foody/gen/assets.gen.dart';
import 'package:app_foody/main.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

abstract class NavigationService {
  BuildContext? currentContext;

  void showLoading();

  void hideLoading();

}

@LazySingleton(as: NavigationService)
class NavigationServiceImpl extends NavigationService {
  @override
  BuildContext get currentContext => navigatorKey.currentContext!;

  bool _canPop() {
    final canPop =
    Navigator.canPop(navigatorKey.currentState!.overlay!.context);
    return canPop;
  }

  @override
  void showLoading() {
    showDialog(
      context: navigatorKey.currentState!.overlay!.context,
      barrierColor: const Color(0xff101010).withOpacity(0.7),
      builder: (context) => const Center(child: AppIndicator(size: 60)),
    );
  }

  @override
  void hideLoading() {
    if (_canPop()) {
      Navigator.of(navigatorKey.currentState!.overlay!.context).pop();
    }
  }

}

class AppIndicator extends StatelessWidget {
  const AppIndicator({
    super.key,
    this.size = 40,
    this.color,
  });

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: size,
      child: Assets.animations.loading.lottie(),
    );
  }
}