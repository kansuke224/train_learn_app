import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/model/station_question.dart';
import 'package:interactive_viewer_01/model/station_question_group.dart';
import 'package:interactive_viewer_01/question/model/question_group.dart';
import 'package:interactive_viewer_01/state/selected_question_code_provider.dart';
import 'package:interactive_viewer_01/state/station_question_group_provider.dart';

final selectedStationQuestionProvider = Provider<StationQuestion?>((ref) {
  // 選択中のquestinoCodeとquestionGroupを取得
  QuestionCode? questionCode = ref.watch(selectedQuestionCodeProvider);
  StationQuestionGroup? questionGroup = ref.watch(stationQuestionGroupProvider);
  if (questionCode == null || questionGroup == null) {
    return null;
  }
  // questionGroupから取得したstationQuestionを返す
  return questionGroup.questionMap[questionCode];
});
