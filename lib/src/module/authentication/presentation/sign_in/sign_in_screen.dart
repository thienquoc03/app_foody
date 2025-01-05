import 'package:app_foody/di/di.dart';
import 'package:app_foody/src/module/authentication/presentation/sign_in/controller/sign_in_controller.dart';
import 'package:app_foody/src/module/widget/app_widget.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final SignInController controller = getIt();

  @override
  Widget build(BuildContext context) {
    return AppWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            behavior: HitTestBehavior.opaque,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/icons/logo1.png', // Replace with your image path
                        width: 200, // Adjust width as needed
                        height: 200,
                        // Adjust height as needed
                      ),
                    ),
                    const SizedBox(height: 1),
                    const Text(
                      'Welcome! To KA KA',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Sign in to your account',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xffB0B0B0),
                      ),
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    TextFormField(
                      controller: controller.emailController,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                      focusNode: controller.emailFocus,
                      textInputAction: TextInputAction.next,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        filled: true,
                        fillColor: const Color(0xff1F1F1F),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(43),
                          borderSide: const BorderSide(
                            color: Color(0xff1F1F1F),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(43),
                          borderSide: const BorderSide(
                            color: Color(0xff1F1F1F),
                          ),
                        ),
                        hintText: 'abcxyz@example.com',
                        hintStyle: const TextStyle(
                          fontSize: 14,
                          color: Color(0xff616161),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 6),
                    ValueListenableBuilder(
                      valueListenable: controller.hidePass,
                      builder: (_, __, ___) {
                        return TextFormField(
                          obscureText: controller.hidePass.value,
                          controller: controller.passController,
                          textInputAction: TextInputAction.go,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                          onFieldSubmitted: (_) {
                            if (controller.canSubmit) {
                              controller.submit();
                            }
                          },
                          focusNode: controller.passFocus,
                          cursorColor: Colors.white,
                          decoration: InputDecoration(
                            constraints: const BoxConstraints(maxHeight: 48),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                            filled: true,
                            fillColor: const Color(0xff1F1F1F),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(43),
                              borderSide: const BorderSide(
                                color: Color(0xff1F1F1F),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(43),
                              borderSide: const BorderSide(
                                color: Color(0xff1F1F1F),
                              ),
                            ),
                            suffixIcon: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: controller.changeHidePass,
                                  icon: Builder(
                                    builder: (_) {
                                      if (controller.hidePass.value) {
                                        return const Icon(
                                          Icons.visibility,
                                          color: Color(0xffB0B0B0),
                                          size: 20,
                                        );
                                      }

                                      return const Icon(
                                        Icons.visibility_off,
                                        color: Color(0xffB0B0B0),
                                        size: 20,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('');
                        },
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ListenableBuilder(
                      listenable: Listenable.merge([
                        controller.emailController,
                        controller.passController,
                      ]),
                      builder: (_, __) {
                        return ElevatedButton(
                          onPressed:
                              controller.canSubmit ? controller.submit : null,
                          style: ElevatedButton.styleFrom(
                            disabledBackgroundColor:
                                const Color(0xFFFAFAFA).withOpacity(0.3),
                            fixedSize: const Size.fromHeight(52),
                            backgroundColor: const Color(0xFFFAFAFA),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            ),
                          ),
                          child: const Text(
                            'Sign in',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff1E1E1E),
                            ),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('/sign_up');
                      },
                      style: ElevatedButton.styleFrom(
                        disabledBackgroundColor:
                        const Color(0xFFFAFAFA).withOpacity(0.3),
                        fixedSize: const Size.fromHeight(52),
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                          side: const BorderSide(color: Colors.white)
                        ),
                      ),
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
