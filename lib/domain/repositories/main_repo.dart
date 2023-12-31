import 'package:learning_app/data/network/dto/auth_dto.dart';
import 'package:learning_app/data/network/dto/create_course_dto.dart';
import 'package:learning_app/domain/models/auth_response.dart';
import 'package:learning_app/domain/models/message_response.dart';

import '../models/chat.dart';
import '../models/course.dart';
import '../models/message.dart';
import '../models/summary.dart';
import '../models/topic.dart';

abstract class MainRepo {
  Future<AuthResponse> login(final AuthDto dto);

  Future<AuthResponse> register(final AuthDto dto);

  Future<List<Course>> getCoursesList();
  
  Future<void> createCourse(final String youtubeURL);

  Future<List<Topic>> getCourseTopics(final int courseId);

  Future<Chat> generateChat(final String topicId);

  Future<Summary> getSummary(final int topicId);

  Future<void> createChat(final int topicId);

  Future<List<Message>> getMessages(final int topicId, final int questionId);

  Future<MessageResponse> sendReceiveMessage(
    final int topicId,
    final int questionId,
    final String text,
  );
}
