import 'package:flutter/material.dart';
import 'package:learning_app/presentation/widgets/custom_app_bar.dart';

class TopicScreen extends StatelessWidget {
  const TopicScreen({required this.topicId, super.key});
  final String topicId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(46),
        child: CustomAppBar(
          leadingText: 'Topics',
          title: 'Introduction',
          subtitle: 'Question 1',
        ),
      ),
      body: Center(
        child: Text(topicId),
      ),
    );
  }
}
