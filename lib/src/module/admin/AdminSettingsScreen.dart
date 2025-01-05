import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../authentication/presentation/sign_in/sign_in_screen.dart';

class AdminSettingsScreen extends StatelessWidget {
  // Hàm đăng xuất
  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // Hiển thị thông báo đăng xuất
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đăng xuất thành công')),
      );

      // Chuyển hướng đến màn hình đăng nhập sau khi đăng xuất
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SignInScreen()), // Thay SignInScreen bằng widget đăng nhập của bạn
      );
    } catch (e) {
      // Nếu có lỗi khi đăng xuất
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi đăng xuất: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Các mục cài đặt khác (nếu có)
            // const ListTile(
            //   leading: Icon(Icons.settings),
            //   title: Text('Cài đặt tài khoản'),
            // ),
            // const Divider(),
            // const ListTile(
            //   leading: Icon(Icons.notifications),
            //   title: Text('Thông báo'),
            // ),
            // const Divider(),

            // Mục đăng xuất
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Đăng xuất'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Xử lý đăng xuất khi nhấn vào
                _signOut(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
