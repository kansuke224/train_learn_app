import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/presentation/controller/get_question_list_controller.dart';
import 'package:interactive_viewer_01/ui/provider/is_all_answer_finished_provider.dart';
import 'package:interactive_viewer_01/ui/widget/train_line_question/component/train_line_map_interactive_viewer.dart';

class TrainLineQuestionScreen extends ConsumerStatefulWidget {
  const TrainLineQuestionScreen({
    super.key,
    required this.questionGroupCode,
    required this.questionGroupName,
    required this.getQuestionListController,
  });

  final String questionGroupCode;
  final String questionGroupName;

  final GetQuestionListController getQuestionListController;
  // final AnswerQuestionController answerQuestionController;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TrainLineQuestionScreenState();
}

class _TrainLineQuestionScreenState extends ConsumerState<TrainLineQuestionScreen> {
  @override
  void initState() {
    super.initState();
    // 画面描画が始まるまで待機
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 駅ごとの問題リスト取得
      widget.getQuestionListController.handle(
        widget.questionGroupCode,
      );

      // 状態の初期化(状態の監視をしていないので、autoDisposeをつけると毎回の読み取り時に初期化されてしまう)
      ref.read(isAllAnswerFinishedProvider.notifier).state = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.questionGroupName),
      ),
      // BottomSheet対応
      resizeToAvoidBottomInset: true,
      body: TrainLineMapInteractiveViewer(),
    );
  }
}
