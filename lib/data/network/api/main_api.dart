import 'package:dio/dio.dart';
import 'package:learning_app/data/network/dto/auth_dto.dart';
import 'package:learning_app/data/network/dto/message_dto.dart';
import 'package:learning_app/domain/models/auth_response.dart';
import 'package:learning_app/domain/models/chat.dart';
import 'package:learning_app/domain/models/course.dart';
import 'package:learning_app/domain/models/message.dart';
import 'package:learning_app/domain/models/message_response.dart';
import 'package:learning_app/domain/models/topic.dart';
import 'package:retrofit/http.dart';

part 'main_api.g.dart';

@RestApi()
abstract class MainApi {
  factory MainApi(Dio dio, {String? baseUrl}) = _MainApi;

  @POST('/login')
  Future<AuthResponse> login(@Body() final AuthDto dto);

  @POST('/register')
  Future<AuthResponse> register(@Body() final AuthDto dto);

  @GET('/courses')
  Future<List<Course>> getCoursesList();

  @GET('/courses/{course_id}')
  Future<List<Topic>> getCourseTopics(@Path('course_id') final int courseId);

  // @GET('/courses/{course_id}/{topic_id}/generate')
  @GET('/topics/{topic_id}/generate')
  Future<Chat> generateChat(
    // @Path('course_id') final String courseId,
    @Path('topic_id') final String topicId,
  );

  // @GET('/courses/{course_id}/{topic_id}/{question_id}')
  // @GET('/question/{question_id}')
  // Future<Chat> getMessages(
  //   // @Path('course_id') final String courseId,
  //   // @Path('topic_id') final String topicId,
  //   @Path('question_id') final int questionId,
  // );

  // @POST('/courses/{course_id}/{topic_id}/{question_id}/send-receive-message')
  @POST('/topics/{topic_id}/question')
  Future<MessageResponse> sendReceiveMessage(
    // @Path('course_id') final String courseId,
    // @Path('topic_id') final String topicId,
    @Path('topic_id') final int topicId,
    @Body() final MessageDto message,
  );

  // @GET('/courses/{courses_id}/topics/{topic_id}')
  // Future<Topic> getMessages(
  //   @Path('topic_id') final int topicId,
  //   @Path('courses_id') final int courseId,
  // );

  @GET('/chat/{topic_id}/{question_id}')
  Future<List<Message>> getMessages(
    @Path('topic_id') final int topicId,
    @Path('question_id') final int questionId,
  );


}
