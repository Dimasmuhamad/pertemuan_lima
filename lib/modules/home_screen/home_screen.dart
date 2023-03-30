import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../config/app_routes.dart';
import '../../models/user.dart';
import 'home_screen_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.user,
  });
  final User user;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late Size size;

  tapBottomItem(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: HeaderWidget(
              user: widget.user,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: SearchFieldWidget(),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: SectionTitle(
                    label: "Berita crypto",
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: InkWell(
                    onTap: () {
                      GoRouter.of(context).goNamed(
                        AppRoutes.newsDetailHot,
                      );
                    },
                    child: HottestNewsCard(
                      size: size,
                      pictureUrl:
                          "data:image/jpeg;base64,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",
                      newsTitle: "Tengok Harga Bitcoin.",
                      onTap: () {},
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: SectionTitle(
                    label: "Latest News",
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: LatestNewsIndexCardSection(
                    size: size,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: tapBottomItem,
          items: [
            bottomMenuItem("Home", Icons.home_rounded),
            bottomMenuItem("News", Icons.newspaper_rounded),
            bottomMenuItem("Menu", Icons.menu_rounded),
          ]),
    );
  }

  BottomNavigationBarItem bottomMenuItem(String label, IconData iconData) {
    return BottomNavigationBarItem(
        label: label,
        icon: Icon(
          iconData,
        ));
  }
}
