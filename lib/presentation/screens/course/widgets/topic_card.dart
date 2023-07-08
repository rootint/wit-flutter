import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/config/router/app_router.dart';
import 'package:learning_app/domain/models/topic.dart';

class TopicCard extends StatelessWidget {
  const TopicCard({
    required this.topic,
    required this.number, 
    super.key,
  });
  final Topic topic;
  final int number;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        TopicRoute(topicId: topic.id).push(context);
      },
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.black.withOpacity(0.25),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                border: const Border.fromBorderSide(
                  BorderSide(color: Colors.black, width: 2),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              width: 48,
              height: 48,
              child: Center(
                child: Text(
                  number.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    topic.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                      '${topic.questions.length}/${topic.questionsTotal} questions completed',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black.withOpacity(0.5),
                      ))
                ],
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              CupertinoIcons.chevron_right,
              size: 22,
            )
          ],
        ),
      ),
    );
  }
}
