import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/config/router/app_router.dart';

import '../../domain/models/course.dart';

class CourseCard extends StatelessWidget {
  const CourseCard({
    required this.heroTag,
    required this.course,
    required this.isHomePage,
    super.key,
  });
  final String heroTag;
  final Course course;
  final bool isHomePage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: GestureDetector(
        onTap: isHomePage
            ? () => CourseRoute(courseId: course.id).push(context)
            : null,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.black,
          ),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        course.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: Colors.white,
                          height: 1.3,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    const Icon(
                      CupertinoIcons.star_fill,
                      color: Colors.white,
                      size: 22,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Stack(
                  children: [
                    Positioned(
                      child: Container(
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.fromBorderSide(
                            BorderSide(color: Colors.grey.shade800),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: (MediaQuery.of(context).size.width - 64) -
                          (course.topicsCompleted / course.topicsTotal) /
                              (MediaQuery.of(context).size.width - 64),
                      child: Container(
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    '${(course.topicsCompleted / course.topicsTotal / 100).toStringAsFixed(0)}% Completed',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withOpacity(0.7),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Text(
                      '${course.topicsTotal} Topics',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    if (isHomePage)
                      const Icon(
                        CupertinoIcons.arrow_right,
                        color: Colors.white,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
