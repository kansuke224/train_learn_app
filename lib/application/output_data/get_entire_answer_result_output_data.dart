class GetEntireAnswerResultOutputData {
  GetEntireAnswerResultOutputData({
    required this.answerNum,
    required this.answerScore,
    required this.answerResultList,
  });

  final int answerNum;
  final int answerScore;
  final List<({bool answerResult, String stationName, String stationShortName})> answerResultList;
}
