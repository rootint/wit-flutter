import 'package:learning_app/domain/models/course.dart';
import 'package:learning_app/domain/models/topic.dart';
import 'package:learning_app/domain/repositories/main_repo.dart';

class MainRepoImpl implements MainRepo {
  @override
  Future<List<Course>> getCoursesList() {
    // TODO: implement getCoursesList
    throw UnimplementedError();
  }

  @override
  Future<List<Topic>> getTopicsList(String courseId) {
    // TODO: implement getTopicsList
    throw UnimplementedError();
  }
}
