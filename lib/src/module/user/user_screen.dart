  import 'package:flutter/material.dart';
  import 'Home.dart' as home_page;
  import 'NotiFake.dart' as notification_page;
  import 'cart.dart' as cart_page;
  import 'PersonalProfileScreen.dart' as profile_page;

  class UserScreen extends StatefulWidget {
    const UserScreen({super.key});

    @override
    State<UserScreen> createState() => _UserScreenState();
  }

  class _UserScreenState extends State<UserScreen> {
    final PageController _pageController = PageController();
    int _currentIndex = 0;

    void _onItemTapped(int index) {
      setState(() {
        _currentIndex = index;
      });
      _pageController.jumpToPage(index); // Jump to the respective page
    }
    String _getAppBarTitle() {
      switch (_currentIndex) {
        case 0:
          return 'Trang chủ';
        case 1:
          return 'Thông báo';
        case 2:
          return 'Giỏ Hàng';
        case 3:
          return 'Thông Tin Cá Nhân';
        default:
          return ''; // Or a default title
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: const Color(0xff45C3D2),
        appBar: AppBar(
          backgroundColor: Colors.white38,
          title: Text(_getAppBarTitle(),
              style: const TextStyle(color: Colors.black)),
        ),
        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(), // Prevents swipe to change pages
          children: [ // Remove const here
            const home_page.Home(), // Correct usage with alias
            const notification_page.NotiFake(),
            const cart_page.CartScreen(),
            const profile_page.PersonalProfileScreen(),// If the PersonalProfileScreen Widget itself is const
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: _onItemTapped, // Handle bottom navigation item taps
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
              icon: Icon(Icons.home),
              label: 'Trang chủ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Thông báo',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Giỏ Hàng',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Cá Nhân',
            ),
          ],
        ),
      );
    }
  }
