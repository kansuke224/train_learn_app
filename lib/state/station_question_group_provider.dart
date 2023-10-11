import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/model/station_question_group.dart';

final stationQuestionGroupProvider = StateNotifierProvider<StationQuestionGroupNotifier, StationQuestionGroup?>((ref) {
  return StationQuestionGroupNotifier();
});

class StationQuestionGroupNotifier extends StateNotifier<StationQuestionGroup?> {
  StationQuestionGroupNotifier() : super(null);

  // StationQuestionGroupをセットする
  // (問題一覧画面のクリック時)
  void setStationQuestionGroup(StationQuestionGroup stationQuestionGroup) {
    state = stationQuestionGroup;
  }

  // 指定の問題に解答をセットする
  void setAnswer(String questionCode, String actualAnswer) {
    if (state == null) return;
    state = state!.setAnswerToQuestion(questionCode, actualAnswer);
  }

  // 正当数を計算する
  void countAnswerScore() {
    if (state == null) return;
    state = state!.countAnswerScore();
  }
}
