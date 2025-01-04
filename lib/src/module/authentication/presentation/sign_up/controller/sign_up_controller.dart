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
class SignUpController extends ChangeNotifier {
  final AuthenticationRepository repository;
  final NavigationService navigationService;

  SignUpController(this.navigationService, this.repository);

  final TextEditingController _emailController = TextEditingController();

  TextEditingController get emailController => _emailController;

  final TextEditingController _passController = TextEditingController();

  TextEditingController get passController => _passController;

  final TextEditingController _passConfirmController = TextEditingController();

  TextEditingController get passConfirmController => _passConfirmController;

  final FocusNode _emailFocus = FocusNode();

  FocusNode get emailFocus => _emailFocus;

  final FocusNode _passFocus = FocusNode();

  FocusNode get passFocus => _passFocus;

  final FocusNode _passConfirmFocus = FocusNode();

  FocusNode get passConfirmFocus => _passConfirmFocus;

  String get email => _emailController.text;

  String get password => _passController.text;

  String get passwordConfirm => _passConfirmController.text;

  bool get canSubmit {
    return email.isNotEmpty &&
        email.isEmail &&
        password.isNotEmpty &&
        passwordConfirm.isNotEmpty;
  }

  final _hidePass = ValueNotifier<bool>(true);

  ValueNotifier<bool> get hidePass => _hidePass;

  final _hidePassConfirm = ValueNotifier<bool>(true);

  ValueNotifier<bool> get hidePassConfirm => _hidePassConfirm;

  void changeHidePass() {
    _hidePass.value = !_hidePass.value;
  }

  void changeHidePassConfirm() {
    _hidePassConfirm.value = !_hidePassConfirm.value;
  }

  Future submit() async {
    emailFocus.unfocus();
    passFocus.unfocus();
    passConfirmFocus.unfocus();
    if (password != passwordConfirm) {
      ToastService.insertToast(
          const ToastErrorWidget(text: 'Mật khẩu không khớp'),
          duration: const Duration(seconds: 3));
      return;
    }
    navigationService.showLoading();
    try {
      appUser = await repository.signUpWithEmailAndPassword(
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
