import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/presentation/enum/answer_result.dart';
import 'package:interactive_viewer_01/presentation/view_model/get_question_list_view_model.dart';
import 'package:interactive_viewer_01/ui/provider/question_answer_result_provider.dart';
import 'package:interactive_viewer_01/ui/style/station_button_style.dart';
import 'package:interactive_viewer_01/ui/widget/train_line_question/component/bottom_sheet.dart';

class StationButton extends ConsumerWidget {
  const StationButton({
    super.key,
    required this.question,
    required this.buttonStyle,
  });

  final GetQuestionListViewModel question;
  final StationButtonStyle buttonStyle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 解答結果を確認する
    final AnswerResult answerResult = ref.watch(
      questionAnswerResultProvider(question.questionCode),
    );

    // 解答済み/未解答 で表示を切り替える
    VoidCallback onPressed;
    if (answerResult == AnswerResult.unAnswerd) {
      onPressed = () => handleOnPressed(context, question);
    } else {
      onPressed = () {};
    }

    return SizedBox(
      width: buttonStyle.width,
      height: buttonStyle.height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                buttonStyle.borderRadius,
              ),
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          side: BorderSide(
            color: buttonStyle.color,
            width: 3.0,
          ),
          padding: EdgeInsets.zero,
        ),
        child: const Text(""),
      ),
    );
  }

  // 駅押下時の処理
  handleOnPressed(BuildContext context, GetQuestionListViewModel question) {
    // ボトムシート表示
    showModalBottomSheet(
      context: context,
      barrierColor: Colors.black12,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return BottomSheetContent(question: question);
      },
    );
  }
}
