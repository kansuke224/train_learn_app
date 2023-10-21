class GetQuestionListViewModel {
  GetQuestionListViewModel({
    required this.questionCode,
    required this.stationName,
    required this.trainLineList,
  });

  // 問題コード
  final String questionCode;
  // 駅名称
  final String stationName;
  // 路線ごとの路線名と駅省略名のリスト
  final List<({String trainLineCode, String trainLineName, String stationShortName})> trainLineList;
}
