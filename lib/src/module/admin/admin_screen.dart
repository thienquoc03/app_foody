import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app_foody/src/module/widget/app_widget.dart'; // Giả sử AppWidget có thể được sử dụng cho cấu trúc chung

import '../authentication/presentation/sign_in/sign_in_screen.dart';
import 'AdminSettingsScreen.dart';
import 'UserManagement.dart'; // Import FirebaseAuth

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index); // Chuyển đến màn hình tương ứng
  }

  String _getAppBarTitle() {
    switch (_currentIndex) {
      case 0:
        return 'Dashboard';
      case 1:
        return 'Quản lý người dùng';
      case 2:
        return 'Đơn hàng';
      case 3:
        return 'Cài đặt';
      default:
        return ''; // Hoặc một tiêu đề mặc định
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppWidget(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            _getAppBarTitle(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(), // Không cho phép vuốt để thay đổi trang
          children: [
            // Các widget tương ứng cho các màn hình của Admin
            Center(child: Text('Dashboard', style: TextStyle(color: Colors.white))),
            Center(child: Text('Orders', style: TextStyle(color: Colors.white))),
            AdminSettingsScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: _onItemTapped, // Xử lý khi người dùng nhấn vào các mục
          showUnselectedLabels: true,
          showSelectedLabels: true,
          selectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Color(0xff45C3D2),
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Colors.white24,
          ),
          selectedItemColor: const Color(0xff45C3D2),
          unselectedItemColor: Colors.black,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.store),
              label: 'Sản Phẩm',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Người dùng',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Đơn hàng',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Cài đặt',
            ),
          ],
        ),
      ),
    );
  }
}
