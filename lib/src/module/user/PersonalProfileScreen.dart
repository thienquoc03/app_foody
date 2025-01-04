import 'package:flutter/material.dart';

class PersonalProfileScreen extends StatelessWidget {
  const PersonalProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cá Nhân'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Avatar và thông tin cá nhân
            Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/avatar.png'), // Thay bằng ảnh avatar của bạn
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Nguyễn Văn A',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'nguyenvana@gmail.com',
                      style: TextStyle(color: Colors.grey),
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
              onTap: () {
                // Thêm logic đăng xuất
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Đã đăng xuất')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
