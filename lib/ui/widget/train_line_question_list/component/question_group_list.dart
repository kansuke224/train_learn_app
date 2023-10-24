import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/ui/provider/question_group_list_provider.dart';
import 'package:interactive_viewer_01/ui/widget/train_line_question_list/component/question_group_tile.dart';

class QuestionGroupList extends ConsumerWidget {
  const QuestionGroupList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        shrinkWrap: true,
        // physics: const NeverScrollableScrollPhysics(),
        children: [
          for (final questionGroup in questionGroupList)
            QuestionGroupTile(
              questionGroup: questionGroup,
            ),
          const SizedBox(
            height: 24,
          )
        ],
      );
    }
  }
}
