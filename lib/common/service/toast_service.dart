import 'package:app_foody/src/module/widget/toast_widget.dart';
import 'package:flutter/material.dart';

GlobalKey<ToastWidgetState> toastKey = GlobalKey<ToastWidgetState>();

class ToastService {
  static void insertToast(
      Widget toast, {
        Duration? duration,
        Alignment? alignment,
      }) {
    toastKey.currentState?.insertView(
      toast,
      duration: duration,
      alignment: alignment,
    );
  }

  static void removeToast(Widget toast) {
    toastKey.currentState?.removeView();
  }
}