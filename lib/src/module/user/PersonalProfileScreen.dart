import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../authentication/presentation/sign_in/sign_in_screen.dart';

class PersonalProfileScreen extends StatelessWidget {
  const PersonalProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,


      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                backgroundColor: Colors.blue, // Màu nền cho avatar
                child: const Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.white, // Màu của icon
                ),),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Text(
                      FirebaseAuth.instance.currentUser?.email ?? 'Không có email', // Lấy email từ FirebaseAuth
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Danh sách chức năng
            const Divider(),
            ListTile(
              leading: const Icon(Icons.settings, color: Colors.blue),
              title: const Text('Cài đặt tài khoản'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Thêm logic chuyển hướng
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.history, color: Colors.orange),
              title: const Text('Lịch sử giao dịch'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Thêm logic chuyển hướng
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.help, color: Colors.green),
              title: const Text('Trợ giúp'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                // Thêm logic chuyển hướng
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Đăng xuất'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () async {
                // Thực hiện đăng xuất
                await FirebaseAuth.instance.signOut();

                // Hiển thị thông báo SnackBar
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Đã đăng xuất')),
                );

                // Chuyển hướng đến màn hình đăng nhập
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInScreen()), // Thay SignInScreen bằng widget màn hình đăng nhập của bạn
                );
              },
            ),

          ],
        ),
      ),
    );
  }
}
