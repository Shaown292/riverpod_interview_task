import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:riverpod_interview_task/features/cart/presentation/cart_screen.dart';
import 'package:riverpod_interview_task/features/category/presentation/category_screen.dart';
import 'package:riverpod_interview_task/features/order/presentation/order_screen.dart';
import 'package:riverpod_interview_task/features/profile/presentation/profile_screen.dart';
import '../../home/presentation/home_page.dart';
import '../provider/bottom_nav_provider.dart';


class BottomNavPage extends ConsumerWidget {
  const BottomNavPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider);

    // Each tab's page
    final pages = [
      const HomePage(),
      const CategoryScreen(),
      const OrderScreen(),
      CartScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) => ref.read(bottomNavProvider.notifier).state = i,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.home), label: "Home"),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.list), label: "Category"),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.listAlt), label: "Order"),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.cartShopping), label: "Cart"),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.person), label: "Account"),
        ],
      ),
    );
  }
}
