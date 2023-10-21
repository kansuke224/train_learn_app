import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/presentation/view_model/get_question_list_view_model.dart';
import 'package:interactive_viewer_01/ui/provider/question_answer_result_provider.dart';

class StationText extends ConsumerWidget {
  const StationText({
    super.key,
    required this.question,
  });

  final GetQuestionListViewModel question;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 解答結果を確認する
    final AnswerResult answerResult = ref.watch(
      questionAnswerResultProvider(question.questionCode),
    );

    // 解答結果によって表示を切り替える
    String stationText;
    Color textColor;
    if (answerResult == AnswerResult.unAnswerd) {
      stationText = question.trainLineList[0].stationShortName;
      textColor = Colors.black;
    } else if (answerResult == AnswerResult.correct) {
      stationText = question.stationName;
      textColor = Colors.green;
    } else {
      stationText = question.stationName;
      textColor = Colors.red;
    }

    return Text(
      stationText,
      style: TextStyle(
        color: textColor,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
