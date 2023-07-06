import 'package:flutter/material.dart';
// import 'package:learning_app/config/router/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverPersistentHeader(
            pinned: true,
            delegate: HeaderBar(),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderBar extends SliverPersistentHeaderDelegate {
  const HeaderBar();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container();
  }

  @override
  double get maxExtent => 86;

  @override
  double get minExtent => 46;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
