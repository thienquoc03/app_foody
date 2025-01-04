import 'dart:async';

import 'package:flutter/material.dart';

class ToastWidget extends StatefulWidget {
  const ToastWidget({super.key, required this.child});

  final Widget child;

  @override
  State<ToastWidget> createState() => ToastWidgetState();
}

class ToastWidgetState extends State<ToastWidget>
    with TickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? animation;

  Widget? _widget;

  Timer? _timer;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation = Tween<double>(begin: 0, end: 1.0).animate(
      CurvedAnimation(parent: controller!, curve: Curves.easeIn),
    );
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void removeViewStart({Duration? duration}) {
    if (_timer != null) _timer?.cancel();
    _timer = Timer.periodic(duration ?? const Duration(seconds: 2), (timer) {
      removeView();
      _timer?.cancel();
      _timer = null;
    });
  }

  Alignment _alignment = Alignment.bottomCenter;

  void insertView(
      Widget value, {
        Duration? duration,
        Alignment? alignment,
      }) {
    if (controller!.isAnimating) return;
    if (mounted) {
      setState(() {
        _widget = value;
        _alignment = alignment ?? Alignment.bottomCenter;
      });
    }
    controller!.forward();
    removeViewStart(duration: duration);
  }

  void removeView() async {
    if (_widget == null) return;
    await controller!.reverse();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    animation = Tween<double>(begin: 0, end: 1.0).animate(
      CurvedAnimation(parent: controller!, curve: Curves.easeIn),
    );
    if (mounted) {
      setState(() {
        _widget = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: widget.child),
        Align(
          alignment: _alignment,
          child: AnimatedBuilder(
            animation: controller!,
            builder: (_, __) {
              return FadeTransition(
                opacity: animation!,
                child: SafeArea(
                  top: true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: _widget ?? const SizedBox.shrink(),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
