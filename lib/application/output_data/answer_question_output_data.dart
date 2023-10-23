class AnswerQuestionOutputData {
  AnswerQuestionOutputData({
    required this.questionCode,
    required this.answerResult,
    required this.isAllAnswerFinished,
  });

  final String questionCode;
  final bool answerResult;
  final bool isAllAnswerFinished;
}
