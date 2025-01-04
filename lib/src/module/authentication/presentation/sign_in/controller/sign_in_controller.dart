import 'package:app_foody/common/navigation/navigation_service.dart';
import 'package:app_foody/common/service/toast_service.dart';
import 'package:app_foody/main.dart';
import 'package:app_foody/src/module/authentication/domain/service/authentication_repository.dart';
import 'package:app_foody/src/module/home/home_screen.dart';
import 'package:app_foody/src/module/widget/app_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignInController extends ChangeNotifier {
  final AuthenticationRepository repository;
  final NavigationService navigationService;

  SignInController(this.navigationService, this.repository);

  final TextEditingController _emailController = TextEditingController();

  TextEditingController get emailController => _emailController;

  final TextEditingController _passController = TextEditingController();

  TextEditingController get passController => _passController;

  final FocusNode _emailFocus = FocusNode();

  FocusNode get emailFocus => _emailFocus;

  final FocusNode _passFocus = FocusNode();

  FocusNode get passFocus => _passFocus;

  String get email => _emailController.text;

  String get password => _passController.text;

  bool get canSubmit {
    return email.isNotEmpty && email.isEmail && password.isNotEmpty;
  }

  final _hidePass = ValueNotifier<bool>(true);

  ValueNotifier<bool> get hidePass => _hidePass;

  void changeHidePass() {
    _hidePass.value = !_hidePass.value;
  }

  Future submit() async {
    emailFocus.unfocus();
    passFocus.unfocus();
    try {
      navigationService.showLoading();
      appUser = await repository.signInWithEmailAndPassword(
        email,
        password,
      );

      navigationService.hideLoading();

      if (appUser == null) {
        return;
      }

      Navigator.of(navigatorKey.currentContext!).pushNamedAndRemoveUntil(
        '/home',
        (_) => false,
      );
    } catch (e) {
      navigationService.hideLoading();
      ToastService.insertToast(
          const ToastErrorWidget(text: 'Tài khoản hoặc mật khẩu chưa đúng'),
          duration: const Duration(seconds: 3));
    }
  }
}
