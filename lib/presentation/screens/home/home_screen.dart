import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/presentation/screens/home/widgets/header_bar.dart';
import 'package:learning_app/presentation/widgets/course_card.dart';

import '../../bloc/courses/courses_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    context.read<CoursesBloc>().add(GetCoursesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: RefreshIndicator(
          onRefresh: () async {
            context.read<CoursesBloc>().add(GetCoursesEvent());
          },
          color: Colors.black,
          child: CustomScrollView(
            slivers: [
              const SliverPersistentHeader(
                pinned: true,
                delegate: HeaderBar(),
              ),
              BlocBuilder<CoursesBloc, CoursesState>(
                builder: (context, state) {
                  if (state is CoursesLoading) {
                    return const SliverFillRemaining(
                      child: Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    );
                  }
                  if (state is CoursesLoaded) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          if (index == state.courses.length) {
                            return const SizedBox(height: 32);
                          }
                          return CourseCard(
                            heroTag: '',
                            course: state.courses[index],
                            isHomePage: true,
                          );
                        },
                        childCount: state.courses.length + 1,
                      ),
                    );
                  }
                  return SliverFillRemaining(child: Text(state.toString()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
