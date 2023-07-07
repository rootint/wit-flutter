import 'package:flutter/material.dart';
import 'package:learning_app/config/router/app_router.dart';
import 'package:learning_app/presentation/screens/home/widgets/header_bar.dart';
import 'package:learning_app/presentation/widgets/course_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            const SliverPersistentHeader(
              pinned: true,
              delegate: HeaderBar(),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == 19) {
                    return const SizedBox(height: 32);
                  }
                  return CourseCard(heroTag: '',);
                },
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
