import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/presentation/bloc/courses/courses_bloc.dart';
import 'package:learning_app/presentation/screens/course/widgets/topic_card.dart';
import 'package:learning_app/presentation/widgets/course_card.dart';

import '../../bloc/topics/topics_bloc.dart';
import '../../widgets/custom_app_bar.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({required this.courseId, super.key});
  final int courseId;

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {

  @override
  void initState() {
    context.read<TopicsBloc>().add(GetTopicsEvent(widget.courseId));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(46),
        child: CustomAppBar(
          leadingText: 'Courses',
        ),
      ),
      body: BlocBuilder<TopicsBloc, TopicsState>(
        builder: (context, state) {
          if (state is TopicsLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (state is TopicsLoaded) {
            return Stack(
              children: [
                ListView.builder(
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: CourseCard(
                          heroTag: widget.courseId.toString(),
                          course:
                              context.read<CoursesBloc>().courses[widget.courseId]!,
                          isHomePage: false,
                        ),
                      );
                    }
                    if (index == state.topics.length + 1) {
                      return const SizedBox(height: 64);
                    }
                    // return TopicCard(
                    //   topic: Topic(
                    //     id: '',
                    //     title: 'Introduction',
                    //     courseId: courseId,
                    //     questionsTotal: 5,
                    //     questions: [],
                    //   ),
                    //   number: index,
                    // );
                    return TopicCard(
                      topic: state.topics[index - 1],
                      number: index,
                    );
                  },
                  itemCount: state.topics.length + 2,
                ),
                Positioned(
                  bottom: 32,
                  left: 16,
                  right: 16,
                  child: InkWell(
                    onTap: () {
                      print('afjkladfj');
                    },
                    splashFactory: NoSplash.splashFactory,
                    splashColor: Colors.black.withOpacity(0.25),
                    child: Container(
                      height: 54,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            spreadRadius: 5,
                            blurRadius: 24,
                            offset: const Offset(0, 24),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              // TODO: last uncompleted topic
                              widget.courseId.toString() + 'Introduction',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              CupertinoIcons.arrow_right,
                              size: 20,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
          return Center(
            child: Text(state.toString()),
          );
        },
      ),
    );
  }
}
