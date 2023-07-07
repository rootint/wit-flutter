import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_app/domain/models/topic.dart';
import 'package:learning_app/presentation/screens/course/widgets/topic_card.dart';
import 'package:learning_app/presentation/widgets/course_card.dart';

import '../../widgets/custom_app_bar.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({required this.courseId, super.key});
  final String courseId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(46),
        child: CustomAppBar(
          leadingText: 'Courses',
        ),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemBuilder: (context, index) {
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: CourseCard(heroTag: courseId),
                );
              }
              if (index == 9) {
                return const SizedBox(height: 64);
              }
              return TopicCard(
                topic: Topic(
                  id: '',
                  title: 'Introduction',
                  courseId: courseId,
                  questionsTotal: 5,
                  questionsCompleted: 2,
                  number: index,
                ),
              );
            },
            itemCount: 10,
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
                        courseId + 'Introduction',
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
      ),
    );
  }
}
