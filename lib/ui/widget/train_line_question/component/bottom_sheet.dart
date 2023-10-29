import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/presentation/enum/answer_result.dart';
import 'package:interactive_viewer_01/presentation/view_model/get_question_list_view_model.dart';
import 'package:interactive_viewer_01/ui/provider/di/answer_question_controller_provider.dart';
import 'package:interactive_viewer_01/ui/provider/is_all_answer_finished_provider.dart';
import 'package:interactive_viewer_01/ui/provider/question_answer_result_provider.dart';
import 'package:interactive_viewer_01/ui/style/train_line_color.dart';
import 'package:interactive_viewer_01/ui/widget/train_line_question/component/answer_result_list_dialog.dart';

class BottomSheetContent extends StatefulWidget {
  const BottomSheetContent({
    super.key,
    required this.question,
  });

  final GetQuestionListViewModel question;

  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  final TextEditingController answerNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 36, left: 32, right: 32),
          child: Column(
            children: [
              BottomSheetTop(question: widget.question),
              const SizedBox(height: 16),
              BottomSheetCenter(
                answerNameController: answerNameController,
              ),
              BottomSheetBottom(
                answerNameController: answerNameController,
                question: widget.question,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomSheetTop extends StatelessWidget {
  const BottomSheetTop({
    super.key,
    required this.question,
  });

  final GetQuestionListViewModel question;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 4,
        runSpacing: 4,
        children: [
          for (final trainLine in question.trainLineList)
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: trainLineColorMap[trainLine.trainLineCode],
                  ),
                  child: Text(
                    trainLine.stationShortName,
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  trainLine.trainLineName,
                  style: TextStyle(
                    color: trainLineColorMap[trainLine.trainLineCode],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            )
        ],
      ),
    );
  }
}

class BottomSheetCenter extends StatelessWidget {
  const BottomSheetCenter({
    super.key,
    required this.answerNameController,
  });

  final TextEditingController answerNameController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: answerNameController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: "駅名称",
      ),
    );
  }
}

class BottomSheetBottom extends HookConsumerWidget {
  const BottomSheetBottom({
    super.key,
    required this.question,
    required this.answerNameController,
  });

  final GetQuestionListViewModel question;
  final TextEditingController answerNameController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 解答結果の判定が終わった後の処理
    ref.listen(
      questionAnswerResultProvider(question.questionCode),
      (previous, next) => handleAnswerResultChange(context, ref, next),
    );

    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 4,
        runSpacing: 4,
        children: [
          Consumer(
            builder: (context, ref, child) {
              // 解答結果を取得
              AnswerResult answerResult = ref.watch(questionAnswerResultProvider(question.questionCode));
              // 解答後
              return answerResult == AnswerResult.unCorrect
                  ? Text(
                      '正解 「${question.stationName}」駅',
                      style: const TextStyle(color: Colors.red),
                    )
                  : const Text("");
            },
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('キャンセル'),
              ),
              TextButton(
                onPressed: () => handleOk(context, ref),
                child: const Text('OK'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // OKボタン押下時
  void handleOk(
    BuildContext context,
    WidgetRef ref,
  ) {
    // controllerに解答処理を投げる
    ref.read(answerQuestionControllerProvider)!.handle(
          question.questionCode,
          answerNameController.text,
        );
  }

  // 解答結果がviewChangerで変更された際の処理
  void handleAnswerResultChange(
    BuildContext context,
    WidgetRef ref,
    AnswerResult answerResult,
  ) {
    // 正解・不正解 表示
    showAnswerResultDialog(context, answerResult);
    // 一秒後に正解・不正解とボトムシートを閉じる
    Future.delayed(
      const Duration(milliseconds: 1000),
      () {
        bool isAllAnswerFinished = ref.read(isAllAnswerFinishedProvider);

        hideAnswerResultDialogAndBottomSheet(context);
        // 全ての解答が終了している場合は解答結果ダイアログ表示
        if (isAllAnswerFinished) {
          showAnswerResultListDialog(context);
        }
      },
    );
  }

  // 正解・不正解 表示
  void showAnswerResultDialog(BuildContext context, AnswerResult answerResult) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      builder: (context) {
        return Icon(
          answerResult == AnswerResult.correct ? Icons.circle_outlined : Icons.close,
          size: 100,
          color: answerResult == AnswerResult.correct ? Colors.green : Colors.red,
        );
      },
    );
  }

  // 正解・不正解とボトムシートを閉じる
  void hideAnswerResultDialogAndBottomSheet(BuildContext context) {
    // テキストフィールドのフォーカスを外す(ダイアログを閉じる前にキーボードを消すため)
    FocusNode? focus = FocusManager.instance.primaryFocus;
    if (focus != null) {
      focus.unfocus();
    }
    // 正解・不正解とボトムシートを非表示
    // どっちの記述でもいいらしい
    // Navigator.of(context).popUntil(ModalRoute.withName("/question"));
    Navigator.of(context).popUntil((route) {
      return route.settings.name == "/question";
    });
  }

  // 解答結果リストダイアログ表示
  void showAnswerResultListDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return const AnswerResultListDialog();
      },
    );
  }
}
