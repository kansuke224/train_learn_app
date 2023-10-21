import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/model/station_question_group.dart';
import 'package:interactive_viewer_01/state/answerd_question_count_provider.dart';
import 'package:interactive_viewer_01/state/station_question_group_provider.dart';

final isAnswerFinishedProvider = Provider<bool>((ref) {
  StationQuestionGroup? questionGroup = ref.read(stationQuestionGroupProvider);
  if (questionGroup == null) {
    return false;
  }
  // 全体の問題数
  int allQuestionCount = questionGroup.questionMap.length;
  // 解答済みの問題数
  int answerdQuestionCount = ref.watch(answerdQuestionCountProvider);

  // 全体の質問数と解答済みの質問数が一致するかを返す
  return allQuestionCount == answerdQuestionCount;
});
