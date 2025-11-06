import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod_interview_task/core/theme/app_color.dart';
import 'package:riverpod_interview_task/features/home/widgets/custom_carousels_slider.dart';
import 'package:riverpod_interview_task/features/home/widgets/product_cart.dart';

import '../provider/home_provider.dart';
import '../widgets/category_item.dart';
import '../widgets/custom_search_bar.dart';
import '../widgets/product_card.dart';
import '../widgets/section_header.dart';

final selectedCategoryProvider = StateProvider<int>((ref) => 0);

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = ref.watch(selectedCategoryProvider);
    final List<String> imgList = [
      'https://picsum.photos/id/237/800/400',
      'https://picsum.photos/id/238/800/400',
      'https://picsum.photos/id/239/800/400',
      'https://picsum.photos/id/240/800/400',
    ];
    final icons = [
      FontAwesomeIcons.firstAid,
      FontAwesomeIcons.baby,
      FontAwesomeIcons.female,
      FontAwesomeIcons.male,
    ];
    final names = ["Medicines", "Baby Care", "Woman's care", "Male"];
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: 130,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Container(
            height: 60,
            width: 130,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/logo.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: Row(
          children: [
            FaIcon(FontAwesomeIcons.mapMarkerAlt),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Chattogram",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "Road 2/House No 2",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Icon(
                  FontAwesomeIcons.bell,
                  size: 24,
                  color: AppColors.accentOrange,
                ),

                // Badge
                Positioned(
                  right: -3,
                  top: -3,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: AppColors.accentOrange,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "3",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomSearchBar(),

              const SizedBox(height: 12),
              CustomCarouselSlider(sliderData: imgList),
              const SizedBox(height: 16),

              const SectionHeader(title: "Explore", subtitle: "By Category"),
              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 200, // height of the horizontal list
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal, // 👈 makes it horizontal
                    itemCount: icons.length,
                    itemBuilder: (context, index) {
                      final isSelected = index == selectedIndex;
                      return InkWell(
                        onTap: () {
                          ref.read(selectedCategoryProvider.notifier).state =
                              index;
                        },
                        child: CategoryItem(
                          icon: icons[index],
                          title: names[index],
                          isSelected: isSelected,
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Prescription",
                    style: GoogleFonts.inter(
                      color: AppColors.accentOrange,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  SizedBox(
                    width: 200,
                    child: Text(
                      "Upload your prescription & we will do the rest",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ],
              ),

              // SizedBox(height: 90, child: _rxRow()),
              const SizedBox(height: 20),
              const SectionHeader(title: "Flash Sale", subtitle: "Up to 50%"),
              Row(children: [ProductCart(), SizedBox(width: 5), ProductCart()]),

              const SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width - 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage("assets/images/banner.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              Row(children: [ProductCart(), SizedBox(width: 5), ProductCart()]),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _bigBanner() => ClipRRect(
  borderRadius: BorderRadius.circular(10),
  child: Container(height: 160, color: Colors.orange[100]),
);

// Widget _rxRow() => Row(
//   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   children: const [
//     CategoryItem(icon: Icons.upload, title: "Upload"),
//     CategoryItem(icon: Icons.add_photo_alternate, title: "Gallery"),
//     CategoryItem(icon: Icons.sms, title: "Message"),
//     CategoryItem(icon: Icons.headphones, title: "Help"),
//   ],
// );

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
