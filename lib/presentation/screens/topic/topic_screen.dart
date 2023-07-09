import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_app/presentation/bloc/chat/chat_bloc.dart';
import 'package:learning_app/presentation/widgets/custom_app_bar.dart';

class TopicScreen extends StatefulWidget {
  const TopicScreen({
    required this.topicId,
    required this.questionId,
    super.key,
  });
  final int topicId;
  final int questionId;

  @override
  State<TopicScreen> createState() => _TopicScreenState();
}

class _TopicScreenState extends State<TopicScreen> {
  final TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    context
        .read<ChatBloc>()
        .add(GetChatEvent(widget.topicId, widget.questionId));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      buildWhen: (previous, current) {
        return previous.props != current.props;
      },
      builder: (context, state) {
        if (state is ChatLoading) {
          return Scaffold();
        }
        if (state is ChatLoaded) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(46),
              child: CustomAppBar(
                leadingText: 'Topics',
                title: 'Introduction',
                subtitle: 'Question 1',
              ),
            ),
            body: SafeArea(
              top: false,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.black,
                      ),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              CupertinoIcons.question_circle,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                // 'What is Feature Engineering?',
                                // state.messages.toString(),
                                // 'Testing',
                                'What is the difference between simple linear regression and multiple linear regression?',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      controller: scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemBuilder: (context, index) {
                        final message = state.messages[index];
                        // if (message.sentByUser == 0) {
                        //   return MessageBubble(
                        //     sentByUser: state
                        //       .messages[state.messages.length - index - 1].sentByUser == 1,
                        //     text: state
                        //       .messages[state.messages.length - index - 1]
                        //       .text);
                        // } else {
                        //   return Text(state
                        //       .messages[state.messages.length - index - 1]
                        //       .text);
                        // }
                        return MessageBubble(
                            sentByUser: state
                                    .messages[state.messages.length - index - 1]
                                    .sentByUser ==
                                1,
                            text: state
                                .messages[state.messages.length - index - 1]
                                .text);
                      },
                      itemCount: state.messages.length,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.grey.shade800.withOpacity(0.32),
                        ),
                      ),
                      // color: Colors.green,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              scrollPadding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 8,
                              ),
                              controller: controller,
                              decoration: InputDecoration(
                                hintText: 'Enter your message...',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        Colors.grey.shade800.withOpacity(0.32),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color:
                                        Colors.grey.shade800.withOpacity(0.32),
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
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                              ),
                              cursorColor: Colors.black,
                              // autofocus: true,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 16,
                              ),
                              maxLines: 10,
                              minLines: 1,
                            ),
                          ),
                          const SizedBox(width: 12),
                          InkWell(
                            onTap: () {
                              context.read<ChatBloc>().add(SendMessageEvent(
                                    widget.topicId,
                                    widget.questionId,
                                    controller.text,
                                  ));
                              controller.text = '';
                              scrollController.animateTo(
                                0.0,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeOut,
                              );
                            },
                            splashFactory: NoSplash.splashFactory,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.black,
                              ),
                              width: 42,
                              height: 42,
                              child: const Center(
                                child: Icon(
                                  CupertinoIcons.arrow_up,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        if (state is QuestionLoading) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(46),
              child: CustomAppBar(
                leadingText: 'Topics',
                title: 'Introduction',
                subtitle: 'Question 1',
              ),
            ),
            body: SafeArea(
              top: false,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.black,
                      ),
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              CupertinoIcons.question_circle,
                              color: Colors.white,
                            ),
                            const SizedBox(width: 8),
                            Flexible(
                              child: Text(
                                // 'What is Feature Engineering?',
                                // state.messages.toString(),
                                'Testing',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: scrollController,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      reverse: true,
                      itemBuilder: (context, index) {
                        if (state.messages.length == index) {
                          return Center(
                              child: CircularProgressIndicator.adaptive());
                        }
                        final message = state.messages[index];
                        // if (message.sentByUser == 0) {
                        //   return Text(state.messages[index].text);
                        // } else {
                        //   return Text(state.messages[index].text);
                        // }
                        return MessageBubble(
                            sentByUser: state.messages[index].sentByUser == 1,
                            text: state.messages[index].text);
                      },
                      itemCount: state.messages.length + 1,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: Colors.grey.shade800.withOpacity(0.32),
                        ),
                      ),
                      // color: Colors.green,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              scrollPadding: const EdgeInsets.symmetric(
                                horizontal: 8.0,
                                vertical: 8,
                              ),
                              controller: controller,
                              decoration: InputDecoration(
                                hintText: 'Enter your message...',
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color:
                                        Colors.grey.shade800.withOpacity(0.32),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color:
                                        Colors.grey.shade800.withOpacity(0.32),
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
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                              ),
                              cursorColor: Colors.black,
                              // autofocus: true,
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.5),
                                fontSize: 16,
                              ),
                              maxLines: 10,
                              minLines: 1,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black.withOpacity(0.5),
                            ),
                            width: 42,
                            height: 42,
                            child: const Center(
                              child: CircularProgressIndicator.adaptive(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Scaffold(
          body: Center(
            child: Text(state.toString()),
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    required this.text,
    required this.sentByUser,
    super.key,
  });
  final String text;
  final bool sentByUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Align(
        alignment: sentByUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.6,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: sentByUser ? Colors.black : Colors.white,
            border: sentByUser
                ? null
                : Border.fromBorderSide(
                    BorderSide(
                      color: Colors.grey.shade800.withOpacity(0.4),
                    ),
                  ),
          ),
          padding: const EdgeInsets.all(12),
          child: Text(
            text,
            style: TextStyle(
              color: sentByUser ? Colors.white : Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
