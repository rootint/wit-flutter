// import 'package:either_dart/either.dart';
// import 'package:flutter/material.dart';
// import '../../data/network/dto/core/general_message.dart';
// import '../../data/network/dto/matrix/course.dart';
// import '../models/core/varsityscape_subuser.dart';
// import '../models/matrix/chat_settings.dart';
// import '../models/matrix/matrix_user_data.dart';
// import '../models/matrix/matrix_vs_data.dart';

// import '../models/matrix/matrix_user.dart';

// abstract class MatrixRepo extends ChangeNotifier {
//   Future<Either<GeneralError, String>> getRoomByCourseId(String courseId);

//   Future<Either<GeneralError, Map<String, MatrixCourse>>> matrixCourses();

//   Future<Either<GeneralError, String>> getCourseByRoomId(String roomId);

//   Future<Either<GeneralError, MatrixUser>> getCurrentMatrixUserData();

//   Future<Either<GeneralError, MatrixVSData>> getVSDataByMatrixId(String roomId);

//   Future<Either<GeneralError, VarsityScapeSubUser>> getMatrixUserData(
//       String username);

//   Future<ChatSettings?> retrieveChatSettings();
//   Future<bool> saveChatSettings(ChatSettings settings);
// }

import '../models/course.dart';
import '../models/topic.dart';

abstract class MainRepo {
  Future<List<Course>> getCoursesList();

  Future<List<Topic>> getTopicsList(final String courseId);

  
}