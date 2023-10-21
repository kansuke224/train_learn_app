class GetQuestionGroupListViewModel {
  GetQuestionGroupListViewModel({
    required this.questionGroupCode,
    required this.questionName,
    required this.bestScoreText,
  });

  // 問題コード
  final String questionGroupCode;
  // 問題名
  final String questionName;
  // 自己ベストテキスト
  final String bestScoreText;
}
