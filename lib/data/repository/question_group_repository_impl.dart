import 'package:interactive_viewer_01/application/repository/question_group_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuestionGroupRepositoryImpl implements QuestionGroupRepository {
  @override
  Future<int> getBestScore(String questionGroupCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int bestAnswerScore = prefs.getInt(questionGroupCode) ?? 0;
    return bestAnswerScore;
  }
}
