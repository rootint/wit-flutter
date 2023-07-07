import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learning_app/domain/models/topic.dart';

class TopicCard extends StatelessWidget {
  const TopicCard({
    required this.topic,
    super.key,
  });
  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print('afjkladfj');
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
                  topic.number.toString(),
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
                      '${topic.questionsCompleted}/${topic.questionsTotal} questions completed',
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