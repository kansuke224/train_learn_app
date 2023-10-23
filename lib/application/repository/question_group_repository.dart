abstract class QuestionGroupRepository {
  Future<int> getBestScore(String questionGroupCode);

  Future<void> updateBestScore(String questionGroupCode, int bestScore);
}
