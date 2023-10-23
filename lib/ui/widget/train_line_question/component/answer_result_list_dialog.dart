import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/presentation/view_model/get_entire_answer_result_view_model.dart';
import 'package:interactive_viewer_01/ui/provider/di/get_entire_answer_result_controller_provider.dart';
import 'package:interactive_viewer_01/ui/provider/entire_answer_result_provider.dart';

class AnswerResultListDialog extends ConsumerStatefulWidget {
  const AnswerResultListDialog({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AnswerResultListDialogState();
}

class _AnswerResultListDialogState extends ConsumerState<AnswerResultListDialog> {
  @override
  void initState() {
    super.initState();
    // 画面描画が始まるまで待機
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = ref.read(getEntireAnswerResultControllerProvider);
      controller!.handle();
    });
  }

  @override
  Widget build(BuildContext context) {
    GetEntireAnswerResultViewModel? entireAnswerResult = ref.watch(entireAnswerResultProvider);
    if (entireAnswerResult == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return AlertDialog(
      title: const Text("解答終了"),
      content: Scrollbar(
        thumbVisibility: true,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(entireAnswerResult.answerScoreText),
              for (final answerResult in entireAnswerResult.answerResultList)
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 35,
                      child: Text(answerResult.stationShortName),
                    ),
                    const Text(":"),
                    const SizedBox(width: 5),
                    answerResult.answerResult
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
                      "${answerResult.stationName} 駅",
                      style: TextStyle(
                        color: answerResult.answerResult ? Colors.green : Colors.red,
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
          onPressed: () => handleOk(context),
          child: const Text('OK'),
        ),
      ],
    );
  }

  void handleOk(BuildContext context) {
    // 全部戻って一覧画面を再作成
    Navigator.of(context).pushNamedAndRemoveUntil("/", (route) => false);
  }
}
