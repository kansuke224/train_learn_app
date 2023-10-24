import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/presentation/controller/get_question_group_list_controller.dart';
import 'package:interactive_viewer_01/presentation/view_model/get_question_group_list_view_model.dart';
import 'package:interactive_viewer_01/ui/provider/question_group_list_provider.dart';
import 'package:interactive_viewer_01/ui/style/question_group_color.dart';
import 'package:interactive_viewer_01/ui/widget/train_line_question_list/component/question_group_list.dart';

class TrainLineQuestionListScreen extends ConsumerStatefulWidget {
  const TrainLineQuestionListScreen({
    super.key,
    required this.getQuestionGroupListcontroller,
  });

  final GetQuestionGroupListController getQuestionGroupListcontroller;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TrainLineQuestionListScreenState();
}

class _TrainLineQuestionListScreenState extends ConsumerState<TrainLineQuestionListScreen> {
  @override
  void initState() {
    super.initState();
    // 路線問題一覧取得
    widget.getQuestionGroupListcontroller.handle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24),
            child: Text(
              "路線図クイズ",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: QuestionGroupList(),
          ),
        ],
      ),
    );
  }
}
