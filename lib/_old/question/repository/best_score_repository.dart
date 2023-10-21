import 'package:shared_preferences/shared_preferences.dart';

class BestScoreRepotiory {
  BestScoreRepotiory._internal();

  static final BestScoreRepotiory instance = BestScoreRepotiory._internal();

  factory BestScoreRepotiory() => instance;

  // ベスト正当数を取得する
  Future<int> fetchBestAnswerScore(String questionGroupCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int bestAnswerScore = prefs.getInt(questionGroupCode) ?? 0;
    return bestAnswerScore;
  }

  // ベスト正当数を更新する
  Future<void> storeBestAnswerScore(String questionGroupCode, int bestAnswerScore) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(questionGroupCode, bestAnswerScore);
  }
}
