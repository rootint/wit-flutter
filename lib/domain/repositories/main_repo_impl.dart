import 'package:learning_app/data/network/dto/auth_dto.dart';
import 'package:learning_app/domain/models/auth_response.dart';
import 'package:learning_app/domain/models/chat.dart';
import 'package:learning_app/domain/models/course.dart';
import 'package:learning_app/domain/models/topic.dart';
import 'package:learning_app/domain/repositories/main_repo.dart';

import '../../data/network/api/main_api.dart';

class MainRepoImpl implements MainRepo {
  final MainApi api;
  MainRepoImpl(this.api);

  @override
  Future<List<Course>> getCoursesList() async {
    final response = await api.getCoursesList();
    return response;
  }

  @override
  Future<Chat> generateChat(String topicId) async {
    final response = await api.generateChat(topicId);
    return response;
  }

  @override
  Future<List<Topic>> getCourseTopics(int courseId) async {
    final response = await api.getCourseTopics(courseId);
    return response;
  }

  @override
  Future<Chat> getMessages(String questionId) async {
    final response = await api.getMessages(questionId);
    return response;
  }

  @override
  Future<AuthResponse> login(AuthDto dto) async {
    final response = await api.login(dto);
    return response;
  }

  @override
  Future<AuthResponse> register(AuthDto dto) async {
    final response = await api.register(dto);
    return response;
  }

  @override
  Future<Chat> sendReceiveMessage(String questionId) async {
    final response = await api.sendReceiveMessage(questionId);
    return response;
  }
}
