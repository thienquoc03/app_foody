import 'package:flutter/material.dart';

class NotiFake extends StatefulWidget {
  const NotiFake({super.key});

  @override
  State<NotiFake> createState() => _NotiFakeState();
}

class _NotiFakeState extends State<NotiFake> {
  List<String> notifications = []; // Danh sách thông báo

  // Hàm để thêm thông báo vào danh sách
  void addNotification(String notification) {
    setState(() {
      notifications.add(notification);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              addNotification('Thông báo 1'); // Thêm thông báo khi nút được nhấn
            },
            child: Text('Thêm Thông Báo'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(notifications[index]), // Hiển thị thông báo trong danh sách
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  // Khai báo PageController và currentIndex
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  // Hàm xử lý sự kiện khi nhấn vào mục BottomNavigationBar
  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    _pageController.jumpToPage(index); // Di chuyển đến trang tương ứng
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('User Screen'),
      ),
      body: PageView(
        controller: _pageController, // Liên kết PageController
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          Home(), // Trang Home
          NotiFake(),
          CartScreen(),
          PersonalProfileScreen(), // Trang Notification
          // Thêm các trang khác nếu cần
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex, // Chỉ mục được chọn hiện tại
        onTap: _onItemTapped, // Gọi khi nhấn vào mục
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
          color: Colors.grey,
        ),
        selectedItemColor: const Color(0xff45C3D2),
        unselectedItemColor: Colors.grey,
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
          // Thêm các mục khác nếu cần
        ],
      ),
    );
  }
}

// Các widget ví dụ
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Trang chủ'));
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Giỏ Hàng'));
  }
}

class PersonalProfileScreen extends StatelessWidget {
  const PersonalProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Cá Nhân'));
  }
}
