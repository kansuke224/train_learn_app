import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/presentation/controller/get_question_group_list_controller.dart';
import 'package:interactive_viewer_01/presentation/view_model/get_question_group_list_view_model.dart';
import 'package:interactive_viewer_01/ui/provider/question_group_list_provider.dart';

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
        title: const Text("路線図問題一覧"),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          // 路線図問題一覧(取得が終わるまではnull)
          final questionGroupList = ref.watch(questionGroupListProvider);
          // 以下の制御だとloadingは制御できるけど、errorが制御できないよな、、、
          // AsyncValueとか使ってみるか
          if (questionGroupList == null) {
            // 取得中はローディング表示
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // 取得完了したらリスト表示
            return ListView(
              children: [
                for (final questionGroup in questionGroupList)
                  ListTile(
                    onTap: () => onQuestionGroupSelected(context, questionGroup),
                    title: Text(questionGroup.questionName),
                    subtitle: Text(questionGroup.bestScoreText),
                    trailing: const Icon(Icons.arrow_right),
                  )
              ],
            );
          }
        },
      ),
    );
  }

  // 問題選択時の処理
  onQuestionGroupSelected(
    BuildContext context,
    GetQuestionGroupListViewModel questionGroup,
  ) async {
    // 問題画面へ繊維
    Navigator.of(context).pushNamed(
      "/question",
      arguments: questionGroup,
    );
  }
}
