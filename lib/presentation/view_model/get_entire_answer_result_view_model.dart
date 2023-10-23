class GetEntireAnswerResultViewModel {
  GetEntireAnswerResultViewModel({
    required this.answerScoreText,
    required this.answerResultList,
  });

  final String answerScoreText;
  final List<({bool answerResult, String stationName, String stationShortName})> answerResultList;
}
