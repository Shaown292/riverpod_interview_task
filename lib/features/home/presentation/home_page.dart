import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/home_provider.dart';
import '../widgets/category_item.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/product_card.dart';
import '../widgets/section_header.dart';


class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedBottom = ref.watch(selectedBottomIndexProvider);

    return Scaffold(


      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: selectedBottom,
      //   onTap: (i) => ref.read(selectedBottomIndexProvider.notifier).state = i,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //     BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: "Account"),
      //   ],
      // ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
        
              const CustomSearchBar(),
        
              const SizedBox(height: 12),
              _banner(),
              const SizedBox(height: 16),
        
              const SectionHeader(title: "Explore", subtitle: "By Category"),
              const SizedBox(height: 12),
        
              _categoryRow(),
              const SizedBox(height: 20),
        
              const SectionHeader(title: "Prescription", subtitle: "Upload & Buy Instantly"),
              SizedBox(height: 90, child: _rxRow()),
        
              const SizedBox(height: 20),
              const SectionHeader(title: "Flash Sale", subtitle: "Up to 50%"),
              _productRow(),
        
              const SizedBox(height: 20),
              _todayDealBanner(),
        
              const SizedBox(height: 20),
              const SectionHeader(title: "Trending Tips", subtitle: '',),
              _tipsRow(),
        
              const SizedBox(height: 20),
              const SectionHeader(title: "Medicine", subtitle: '',),
              _productRow(),
              _bigBanner(),
        
              const SizedBox(height: 20),
              const SectionHeader(title: "Baby & Mom Care", subtitle: '',),
              _productRow(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _banner() => ClipRRect(
  borderRadius: BorderRadius.circular(10),
  child: Container(height: 120, color: Colors.blue[100]),
);

Widget _todayDealBanner() => ClipRRect(
  borderRadius: BorderRadius.circular(10),
  child: Container(height: 120, color: Colors.green[100]),
);

Widget _bigBanner() => ClipRRect(
  borderRadius: BorderRadius.circular(10),
  child: Container(height: 160, color: Colors.orange[100]),
);

Widget _categoryRow() {
  final icons = [Icons.medication, Icons.baby_changing_station, Icons.vaccines, Icons.more_horiz];
  final names = ["Medicines", "Baby Care", "Wellness", "More"];

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: List.generate(4, (i) => CategoryItem(icon: icons[i], title: names[i])),
  );
}

Widget _rxRow() => Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: const [
    CategoryItem(icon: Icons.upload, title: "Upload"),
    CategoryItem(icon: Icons.add_photo_alternate, title: "Gallery"),
    CategoryItem(icon: Icons.sms, title: "Message"),
    CategoryItem(icon: Icons.headphones, title: "Help"),
  ],
);

Widget _productRow() => SizedBox(
  height: 250,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 3,
    itemBuilder: (context, i) => const ProductCard(),
  ),
);

Widget _tipsRow() => SizedBox(
  height: 150,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: 3,
    itemBuilder: (context, i) => Container(
      width: 180,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.pink[100],
      ),
    ),
  ),
);
