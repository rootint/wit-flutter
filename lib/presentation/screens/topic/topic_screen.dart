import 'package:flutter/material.dart';

class TopicScreen extends StatelessWidget {
  const TopicScreen({required this.topicId, super.key});
  final String topicId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(topicId),
      ),
    );
  }
}
