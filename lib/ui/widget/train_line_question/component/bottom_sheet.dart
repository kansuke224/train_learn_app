import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/presentation/view_model/get_question_list_view_model.dart';
import 'package:interactive_viewer_01/ui/provider/question_answer_result_provider.dart';
import 'package:interactive_viewer_01/ui/style/train_line_color.dart';

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
      (previous, next) => handleAnswerResultChange(context, next),
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
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
                : const Spacer();
          },
        ),
        const Spacer(),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('キャンセル'),
        ),
        TextButton(
          onPressed: () => handleOk(context, ref),
          child: const Text('OK'),
        ),
      ],
    );
  }

  // OKボタン押下時
  void handleOk(
    BuildContext context,
    WidgetRef ref,
  ) {
    // controllerに解答処理を投げるだけ
    // 下の処理はref.listenで解答結果を監視して処理を実行する

    // // 選択中のQuestionCodeを取得
    // QuestionCode questionCode = ref.read(selectedQuestionCodeProvider)!;
    // // 解答
    // ref.read(stationQuestionGroupProvider.notifier).setAnswer(questionCode, answerNameController.text);
    // // 解答結果を取得
    // bool answerResult = ref.read(selectedStationQuestionProvider)!.answer.answerResult!;

    // // 正解・不正解 表示
    // showDialog(
    //   context: context,
    //   barrierColor: Colors.transparent,
    //   builder: (context) {
    //     return Icon(
    //       answerResult ? Icons.circle_outlined : Icons.close,
    //       size: 100,
    //       color: answerResult ? Colors.green : Colors.red,
    //     );
    //   },
    // );

    // // 1秒後に正解・不正解を非表示
    // Future.delayed(
    //   const Duration(milliseconds: 1000),
    //   () {
    //     // テキストフィールドのフォーカスを外す(ダイアログを閉じる前にキーボードを消すため)
    //     FocusManager.instance.primaryFocus?.unfocus();
    //     // 正解・不正解を非表示
    //     Navigator.of(context).pop();
    //     // 正解であればボトムシートも非表示
    //     // if (answerResult) Navigator.of(context).pop();
    //     Navigator.of(context).pop();

    //     // 問題全体で解答が完了したか判定
    //     if (ref.read(stationQuestionGroupProvider)!.isAnswerFinished()) {
    //       // 解答が完了している場合
    //       // 正当数を計算
    //       ref.read(stationQuestionGroupProvider.notifier).countAnswerScore();
    //       // 解答結果のダイアログを表示する
    //       showDialog(
    //         context: context,
    //         builder: (context) {
    //           return AnswerResultDialog();
    //         },
    //       );
    //     }
    //   },
    // );
  }

  void handleAnswerResultChange(BuildContext context, AnswerResult answerResult) {
    showAnswerResultDialog(context, answerResult);
    Future.delayed(
      const Duration(milliseconds: 1000),
      () {
        hideBottomSheet(context);
      },
    );
  }

  // 正解・不正解 表示
  void showAnswerResultDialog(BuildContext context, AnswerResult answerResult) {
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        return Icon(
          answerResult == AnswerResult.correct ? Icons.circle_outlined : Icons.close,
          size: 100,
          color: answerResult == AnswerResult.correct ? Colors.green : Colors.red,
        );
      },
    );
  }

  void hideBottomSheet(BuildContext context) {
    // テキストフィールドのフォーカスを外す(ダイアログを閉じる前にキーボードを消すため)
    FocusManager.instance.primaryFocus?.unfocus();
    // 正解・不正解とボトムシートを非表示
    Navigator.of(context).popUntil(ModalRoute.withName("/question"));
  }
}

// class AnswerResultDialog extends ConsumerWidget {
//   const AnswerResultDialog({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     StationQuestionGroup stationQuestionGroup = ref.read(stationQuestionGroupProvider)!;
//     return AlertDialog(
//       title: const Text("解答終了"),
//       content: Scrollbar(
//         thumbVisibility: true,
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text("${stationQuestionGroup.questionMap.length}問中 ${stationQuestionGroup.answerScore.thisScore}問 正解"),
//               for (StationQuestion stationQuestion in stationQuestionGroup.questionMap.values)
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       width: 35,
//                       child: Text(stationQuestion.station.shortNameList[0]),
//                     ),
//                     const Text(":"),
//                     const SizedBox(width: 5),
//                     stationQuestion.answer.answerResult ?? false
//                         ? const Icon(
//                             Icons.circle_outlined,
//                             color: Colors.green,
//                             size: 15,
//                           )
//                         : const Icon(
//                             Icons.close,
//                             color: Colors.red,
//                             size: 15,
//                           ),
//                     const SizedBox(width: 3),
//                     Text(
//                       "${stationQuestion.station.name} 駅",
//                       style: TextStyle(
//                         color: stationQuestion.answer.answerResult ?? false ? Colors.green : Colors.red,
//                       ),
//                     ),
//                   ],
//                 ),
//             ],
//           ),
//         ),
//       ),
//       actions: [
//         TextButton(
//           onPressed: () {
//             // ベストスコアの値をquestionGroupListへ再セット
//             ref.invalidate(questionGroupListProvider);
//             // 一覧画面まで戻る
//             Navigator.popUntil(context, (route) => route.isFirst);
//           },
//           child: const Text('OK'),
//         ),
//       ],
//     );
//   }
// }
