import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/model/station_question.dart';
import 'package:interactive_viewer_01/model/station_question_group.dart';
import 'package:interactive_viewer_01/question/model/question_group.dart';
import 'package:interactive_viewer_01/state/station_question_group_provider.dart';

final answerdQuestionCountProvider = Provider<int>((ref) {
  StationQuestionGroup? questionGroup = ref.watch(stationQuestionGroupProvider);
  if (questionGroup == null) {
    return 0;
  }
  Map<QuestionCode, StationQuestion> stationQuestionMap = questionGroup.questionMap;
  // 解答済みのstationQuestionを検索
  List<StationQuestion> answerdList = stationQuestionMap.values
      .where(
        (stationQuestion) => stationQuestion.answer.answerResult != null,
      )
      .toList();
  // listの要素数を返す
  return answerdList.length;
});
