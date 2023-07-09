import 'package:learning_app/data/network/dto/auth_dto.dart';
import 'package:learning_app/domain/models/auth_response.dart';

import '../models/chat.dart';
import '../models/course.dart';
import '../models/topic.dart';

abstract class MainRepo {
  Future<AuthResponse> login(final AuthDto dto);

  Future<AuthResponse> register(final AuthDto dto);

  Future<List<Course>> getCoursesList();

  Future<List<Topic>> getCourseTopics(final int courseId);

  Future<Chat> generateChat(final String topicId);

  Future<Chat> getMessages(final String questionId);

  Future<Chat> sendReceiveMessage(final String questionId);
}