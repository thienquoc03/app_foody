import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const ListTile(
            leading: Icon(Icons.shopping_cart, size: 40, color: Colors.green),
            title: Text(
              'Sản phẩm A',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Số lượng: 1'),
            trailing: Text(
              '200.000đ',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.shopping_cart, size: 40, color: Colors.green),
            title: Text(
              'Sản phẩm B',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Số lượng: 2'),
            trailing: Text(
              '400.000đ',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Tổng cộng: ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  '600.000đ',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle payment logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Thanh toán thành công!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Thanh Toán',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
