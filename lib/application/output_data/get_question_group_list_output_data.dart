class GetQuestionGroupListOutputData {
  GetQuestionGroupListOutputData({
    required this.questionGroupCode,
    required this.questionName,
    required this.questionNum,
    required this.bestScore,
  });

  // 問題コード
  final String questionGroupCode;
  // 問題名
  final String questionName;
  // 問題数
  final int questionNum;
  // 自己ベスト正答数
  final int bestScore;
}
