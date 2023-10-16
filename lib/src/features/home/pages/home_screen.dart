import 'package:flutter/material.dart';
import 'package:petcare_app/src/core/app_constants/app_strings.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../../core/app_constants/app_colors.dart';
import '../../../core/common_widgets/common_appbar_text.dart';
import '../../profile/pages/profile_ui.dart';
import '../../search/pages/search_ui.dart';
import '../../wishlist/pages/wishlist_ui.dart';
import '../widgets/home_drawer.dart';
import '../widgets/home_page_view.dart';
import '../widgets/location_row_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int initialPage = 0;
  List pages = const [HomePageView(), SearchUI(), WishListUI(), ProfileUI()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title:const LocationRowWidget(),
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu,
                color: Theme.of(context).iconTheme.color,
                size: 30,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          )),
      drawer: const HomeDrawer(),
      extendBody: true,
      body: pages[initialPage],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SalomonBottomBar(
          currentIndex: initialPage,
          onTap: (i) => setState(() => initialPage = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text(AppStrings.home),
              selectedColor: Theme.of(context).iconTheme.color,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: const Icon(Icons.search),
              title: const Text(AppStrings.search),
              selectedColor:Theme.of(context).iconTheme.color,
            ),

            /// Favorates
            SalomonBottomBarItem(
              icon: const Icon(Icons.favorite_border),
              title: const Text(AppStrings.wishlist),
              selectedColor:Theme.of(context).iconTheme.color,

            ),

            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text(AppStrings.profile),
              selectedColor: Theme.of(context).iconTheme.color,
            ),
          ],
        ),
      ),
    );
  }
}
