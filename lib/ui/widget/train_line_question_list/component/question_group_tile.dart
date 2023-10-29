import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/presentation/view_model/get_question_group_list_view_model.dart';
import 'package:interactive_viewer_01/ui/provider/selected_question_group_code_provider.dart';
import 'package:interactive_viewer_01/ui/style/question_group_color.dart';

class QuestionGroupTile extends ConsumerWidget {
  const QuestionGroupTile({
    super.key,
    required this.questionGroup,
  });

  final GetQuestionGroupListViewModel questionGroup;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ColorScheme colorScheme = questionGroupColorSchemeMap[questionGroup.questionGroupCode]!;
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: colorScheme.primaryContainer,
            )
          ],
        ),
        child: Material(
          color: colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(100),
          child: InkWell(
            onTap: () => onQuestionGroupSelected(context, ref, questionGroup),
            splashColor: colorScheme.primary.withOpacity(0.1),
            highlightColor: colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(100),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        questionGroup.questionName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                      Text(questionGroup.bestScoreText),
                    ],
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.arrow_right,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // 問題選択時の処理
  onQuestionGroupSelected(
    BuildContext context,
    WidgetRef ref,
    GetQuestionGroupListViewModel questionGroup,
  ) async {
    // 選択中QuestionGroupCodeを更新
    ref.read(selectedQuestionGroupCodeProvider.notifier).state = questionGroup.questionGroupCode;
    // 問題画面へ繊維
    Navigator.of(context).pushNamed(
      "/question",
      arguments: questionGroup,
    );
  }
}
