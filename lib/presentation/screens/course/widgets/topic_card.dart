import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/config/router/app_router.dart';
import 'package:learning_app/domain/models/topic.dart';
import 'package:learning_app/presentation/bloc/chat/chat_bloc.dart';

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                    // const SizedBox(height: 4),
                    // Text('${topic.questions.length}/${5} questions completed',
                    //     style: TextStyle(
                    //       fontSize: 14,
                    //       color: Colors.black.withOpacity(0.5),
                    //     ))
                  ],
                ),
              ),
              const SizedBox(width: 4),
              InkWell(
                onTap: () {
                  context.read<ChatBloc>().add(CreateChatEvent(topic.id));
                },
                child: Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.fromBorderSide(
                      BorderSide(color: Colors.black),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      CupertinoIcons.add,
                      size: 22,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () {
                  SummaryRoute(topicId: topic.id).push(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: const Border.fromBorderSide(
                      BorderSide(color: Colors.black),
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Summary",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,)
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          for (int i = 0; i < topic.questions.length; ++i)
            InkWell(
              onTap: () {
                TopicRoute(topicId: topic.id, questionId: topic.questions[i].id)
                    .push(context);
              },
              child: Row(
                children: [
                  const SizedBox(width: 60),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Question ${i + 1}',
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(topic.questions[i].text,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.5),
                            )),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
