import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_app/presentation/bloc/courses/courses_bloc.dart';

import '../../widgets/custom_app_bar.dart';

class CreateCourseScreen extends StatefulWidget {
  const CreateCourseScreen({super.key});

  @override
  State<CreateCourseScreen> createState() => _CreateCourseScreenState();
}

class _CreateCourseScreenState extends State<CreateCourseScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(46),
        child: CustomAppBar(
          leadingText: 'Courses',
          title: 'Create Course',
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Padding(
              padding: EdgeInsets.only(left: 16.0),
              child: Text(
                'Enter Course\' Youtube URL',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8, 16, 16),
              child: TextFormField(
                scrollPadding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                  vertical: 8,
                ),
                controller: controller,
                decoration: InputDecoration(
                  hintText: 'https://youtube.com/watch?v=example',
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.black,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey.shade800.withOpacity(0.32),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.grey.shade800.withOpacity(0.32),
                    ),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 16,
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 16,
                  ),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                ),
                cursorColor: Colors.black,
                // autofocus: true,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
                maxLines: 1,
                minLines: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: InkWell(
                onTap: () {
                  context
                      .read<CoursesBloc>()
                      .add(CreateCourseEvent(controller.text));
                  showCupertinoModalPopup<void>(
                    context: context,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                      title: const Text('Done'),
                      content: const Text('Please wait until the course is created.'),
                      actions: <CupertinoDialogAction>[
                        CupertinoDialogAction(
                          /// This parameter indicates this action is the default,
                          /// and turns the action's text to bold text.
                          isDefaultAction: true,
                          onPressed: () {
                            Navigator.pop(context);
                            context.pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                  // context.pop();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        "Create Course",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
