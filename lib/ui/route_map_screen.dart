import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/model/station_button_style_info.dart';
import 'package:interactive_viewer_01/model/station_question.dart';
import 'package:interactive_viewer_01/model/station_question_group.dart';
import 'package:interactive_viewer_01/question/model/question_group.dart';
import 'package:interactive_viewer_01/state/is_answer_finished_provider.dart';
import 'package:interactive_viewer_01/state/question_group_list_screen/question_group_list_provider.dart';
import 'package:interactive_viewer_01/state/selected_question_code_provider.dart';
import 'package:interactive_viewer_01/state/selected_station_question_provider.dart';
import 'package:interactive_viewer_01/state/station_question_group_provider.dart';

class RouteMapScreen extends ConsumerWidget {
  const RouteMapScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // const zoomFactor = 1.0;
    const xTranslate = 1000.0;
    const yTranslate = 1000.0;

    var transformationController = TransformationController();
    // transformationController.value.setEntry(0, 0, zoomFactor);
    // transformationController.value.setEntry(1, 1, zoomFactor);
    // transformationController.value.setEntry(2, 2, zoomFactor);
    transformationController.value.setEntry(0, 3, -xTranslate);
    transformationController.value.setEntry(1, 3, -yTranslate);

    // questionGroupを取得
    StationQuestionGroup stationQuestionGroup = ref.read(stationQuestionGroupProvider)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(stationQuestionGroup.questionGroupName),
      ),
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // 路線図
          Positioned(
            child: InteractiveViewer(
              transformationController: transformationController,
              // constrainedをfalseにすることで、
              // 親から受け継いだ制約の最大幅を超えるような制約を課すことができるようになる
              constrained: false,
              maxScale: 5.0,
              minScale: 0.4,
              child: const RouteMap(),
            ),
          ),
          // 回答数カウント
          // Positioned(
          //   left: 15,
          //   top: 30,
          //   child: Container(
          //     width: 80,
          //     height: 30,
          //     decoration: BoxDecoration(
          //       color: Colors.purple[50],
          //       borderRadius: BorderRadius.circular(8),
          //     ),
          //     child: Center(
          //       child: Consumer(
          //         builder: (context, ref, child) {
          //           int correctAnswerCount = ref.watch(correctAnswerCountProvider);
          //           return Text('正答数 : $correctAnswerCount');
          //         },
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

class RouteMap extends ConsumerWidget {
  const RouteMap({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // questionGroupを取得
    StationQuestionGroup stationQuestionGroup = ref.read(stationQuestionGroupProvider)!;
    return Stack(
      children: [
        // 背景路線図
        Positioned(
          child: SvgPicture.asset(
            'assets/路線図(背景用).svg',
            height: 3000,
          ),
        ),
        for (QuestionCode questionCode in stationQuestionGroup.questionMap.keys)
          Consumer(
            builder: (context, ref, child) {
              // 解答済みに変更された場合に駅ボタンをリビルドする
              // bool? answerResult = ref.watch(stationQuestionGroupProvider.select((questionGroup) => questionGroup!.questionMap[questionCode]!.answer.answerResult));
              // StationQuestion
              StationQuestion stationQuestion = stationQuestionGroup.questionMap[questionCode]!;
              StationButtonStyleInfo buttonStyleInfo = stationQuestion.stationButtonStyleInfo;
              return Positioned(
                top: buttonStyleInfo.leftTopPosition.dy,
                left: buttonStyleInfo.leftTopPosition.dx,
                child: StationWithText(
                  questionCode: questionCode,
                  stationQuestion: stationQuestion,
                ),
              );
            },
          ),
      ],
    );
  }
}

class StationWithText extends ConsumerWidget {
  const StationWithText({
    super.key,
    required this.questionCode,
    required this.stationQuestion,
  });

  final QuestionCode questionCode;
  final StationQuestion stationQuestion;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StationButton(
          questionCode: questionCode,
          stationQuestion: stationQuestion,
        ),
        const SizedBox(width: 3),
        StationText(questionCode: questionCode, stationQuestion: stationQuestion),
      ],
    );
  }
}

class StationButton extends ConsumerWidget {
  const StationButton({
    super.key,
    required this.questionCode,
    required this.stationQuestion,
  });

  final QuestionCode questionCode;
  final StationQuestion stationQuestion;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StationButtonStyleInfo buttonStyleInfo = stationQuestion.stationButtonStyleInfo;

    // 解答済みかどうかをanswerResultがnullかどうかで判定する
    bool? answerResult = ref.watch(
      stationQuestionGroupProvider.select(
        (questionGroup) => questionGroup!.questionMap[questionCode]!.answer.answerResult,
      ),
    );

    // 解答済み/未解答 で表示を切り替える
    Color borderColor;
    borderColor = buttonStyleInfo.color;
    VoidCallback onPressed;
    if (answerResult == null) {
      // borderColor = buttonStyleInfo.color;
      onPressed = () => handleOnPressed(context, ref);
    } else {
      // if (answerResult) {
      //   borderColor = Colors.green;
      // } else {
      //   borderColor = Colors.red;
      // }
      onPressed = () {};
    }

    return SizedBox(
      width: buttonStyleInfo.width,
      height: buttonStyleInfo.height,
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                buttonStyleInfo.borderRadius,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          side: BorderSide(
            color: borderColor,
            width: 3.0,
          ),
          padding: EdgeInsets.zero,
        ),
        child: const Text(""),
      ),
    );
  }

  // 駅押下時の処理
  handleOnPressed(BuildContext context, WidgetRef ref) {
    // 選択中のQuestionCodeを更新
    ref.read(selectedQuestionCodeProvider.notifier).state = questionCode;
    // ボトムシート表示
    showBottomSheet(context);
  }

  // ボトムシート(解答入力欄)を表示する
  showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      barrierColor: Colors.black12,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return const SingleChildScrollView(child: BottomSheetContent());
      },
    );
  }
}

class StationText extends ConsumerWidget {
  const StationText({
    super.key,
    required this.questionCode,
    required this.stationQuestion,
  });

  final QuestionCode questionCode;
  final StationQuestion stationQuestion;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 解答済みかどうかをanswerResultがnullかどうかで判定する
    bool? answerResult = ref.watch(
      stationQuestionGroupProvider.select(
        (questionGroup) => questionGroup!.questionMap[questionCode]!.answer.answerResult,
      ),
    );

    // 解答済み/未解答 で表示を切り替える
    String stationText;
    Color textColor;
    if (answerResult == null) {
      stationText = stationQuestion.station.shortNameList[0];
      textColor = Colors.black;
    } else {
      stationText = stationQuestion.station.name;
      if (answerResult) {
        textColor = Colors.green;
      } else {
        textColor = Colors.red;
      }
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

class BottomSheetContent extends StatefulWidget {
  const BottomSheetContent({super.key});

  @override
  State<BottomSheetContent> createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  final TextEditingController answerNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 36, left: 32, right: 32),
        child: Column(
          children: [
            const BottomSheetContentTop(),
            const SizedBox(height: 16),
            BottomSheetContentCenter(
              answerNameController: answerNameController,
            ),
            BottomSheetContentBottom(
              answerNameController: answerNameController,
            ),
          ],
        ),
      ),
    );
  }
}

class BottomSheetContentTop extends ConsumerWidget {
  const BottomSheetContentTop({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 選択中のstationQuestion取得
    StationQuestion stationQuestion = ref.read(selectedStationQuestionProvider)!;
    return SizedBox(
      width: double.infinity,
      child: Wrap(
        alignment: WrapAlignment.start,
        spacing: 4,
        runSpacing: 4,
        children: [
          for (int i = 0; i < stationQuestion.station.trainLineList.length; i++)
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
                    color: stationQuestion.station.trainLineList[i].color,
                  ),
                  child: Text(
                    stationQuestion.station.shortNameList[i],
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Text(
                  stationQuestion.station.trainLineList[i].name,
                  style: TextStyle(
                    color: stationQuestion.station.trainLineList[i].color,
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

class BottomSheetContentCenter extends StatelessWidget {
  const BottomSheetContentCenter({
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

class BottomSheetContentBottom extends HookConsumerWidget {
  const BottomSheetContentBottom({
    super.key,
    required this.answerNameController,
  });

  final TextEditingController answerNameController;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 選択中のstationQuestion取得
    StationQuestion stationQuestion = ref.read(selectedStationQuestionProvider)!;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Consumer(
          builder: (context, ref, child) {
            // 解答結果を取得
            bool? answerResult = ref.watch(selectedStationQuestionProvider.select((stationQuestion) => stationQuestion!.answer.answerResult));
            // 解答後
            return answerResult != null
                ? Text(
                    '正解 「${stationQuestion.answer.correctAnswer}」駅',
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
    // 選択中のQuestionCodeを取得
    QuestionCode questionCode = ref.read(selectedQuestionCodeProvider)!;
    // 解答
    ref.read(stationQuestionGroupProvider.notifier).setAnswer(questionCode, answerNameController.text);
    // 解答結果を取得
    bool answerResult = ref.read(selectedStationQuestionProvider)!.answer.answerResult!;

    // 正解・不正解 表示
    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (context) {
        return Icon(
          answerResult ? Icons.circle_outlined : Icons.close,
          size: 100,
          color: answerResult ? Colors.green : Colors.red,
        );
      },
    );

    // 1秒後に正解・不正解を非表示
    Future.delayed(
      const Duration(milliseconds: 1000),
      () {
        // テキストフィールドのフォーカスを外す(ダイアログを閉じる前にキーボードを消すため)
        FocusManager.instance.primaryFocus?.unfocus();
        // 正解・不正解を非表示
        Navigator.of(context).pop();
        // 正解であればボトムシートも非表示
        // if (answerResult) Navigator.of(context).pop();
        Navigator.of(context).pop();

        // 問題全体で解答が完了したか判定
        if (ref.read(stationQuestionGroupProvider)!.isAnswerFinished()) {
          // 解答が完了している場合
          // 正当数を計算
          ref.read(stationQuestionGroupProvider.notifier).countAnswerScore();
          // 解答結果のダイアログを表示する
          showDialog(
            context: context,
            builder: (context) {
              return AnswerResultDialog();
            },
          );
        }
      },
    );
  }
}

class AnswerResultDialog extends ConsumerWidget {
  const AnswerResultDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    StationQuestionGroup stationQuestionGroup = ref.read(stationQuestionGroupProvider)!;
    return AlertDialog(
      title: const Text("解答終了"),
      content: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("${stationQuestionGroup.questionMap.length}問中 ${stationQuestionGroup.answerScore.thisScore}問 正解"),
              for (StationQuestion stationQuestion in stationQuestionGroup.questionMap.values)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 35,
                      child: Text(stationQuestion.station.shortNameList[0]),
                    ),
                    const Text(":"),
                    const SizedBox(width: 5),
                    stationQuestion.answer.answerResult ?? false
                        ? const Icon(
                            Icons.circle_outlined,
                            color: Colors.green,
                            size: 15,
                          )
                        : const Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 15,
                          ),
                    const SizedBox(width: 3),
                    Text(
                      "${stationQuestion.station.name} 駅",
                      style: TextStyle(
                        color: stationQuestion.answer.answerResult ?? false ? Colors.green : Colors.red,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            // ベストスコアの値をquestionGroupListへ再セット
            ref.invalidate(questionGroupListProvider);
            // 一覧画面まで戻る
            Navigator.popUntil(context, (route) => route.isFirst);
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
