import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/application/use_case/get_question_group_list_usecase.dart';
import 'package:interactive_viewer_01/application/use_case/get_question_list_use_case.dart';
import 'package:interactive_viewer_01/data/repository/question_group_repository_impl.dart';
import 'package:interactive_viewer_01/presentation/controller/get_question_group_list_controller.dart';
import 'package:interactive_viewer_01/presentation/controller/get_question_list_controller.dart';
import 'package:interactive_viewer_01/presentation/presenter/get_question_group_list_presenter.dart';
import 'package:interactive_viewer_01/presentation/presenter/get_question_list_presenter.dart';
import 'package:interactive_viewer_01/presentation/view_model/get_question_group_list_view_model.dart';
import 'package:interactive_viewer_01/ui/view_changer/get_question_group_list_view_changer.dart';
import 'package:interactive_viewer_01/ui/view_changer/get_question_list_view_changer.dart';
import 'package:interactive_viewer_01/ui/widget/train_line_question/train_line_question_screen.dart';
import 'package:interactive_viewer_01/ui/widget/train_line_question_list/train_line_question_list_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // svgを事前にキャッシュ
    const loader = SvgAssetLoader(
      "assets/路線図(背景用).svg",
    );
    svg.cache.putIfAbsent(loader.cacheKey(null), () => loader.loadBytes(null));

    return ProviderScope(
      child: Consumer(
        builder: (context, ref, child) {
          return MaterialApp(
            title: "Flutter Demo",
            theme: ThemeData(),
            debugShowCheckedModeBanner: false,
            onGenerateRoute: (settings) {
              if (settings.name == "/") {
                return _questonGroupListRoute(ref);
              } else if (settings.name == "/question") {
                final questionGroupViewModel = settings.arguments as GetQuestionGroupListViewModel;
                return _questonRoute(
                  ref,
                  questionGroupViewModel.questionGroupCode,
                  questionGroupViewModel.questionName,
                );
              }
              throw Exception("There is no such page: ${settings.name}");
            },
          );
        },
      ),
    );
  }

  // 路線図問題一覧画面
  MaterialPageRoute _questonGroupListRoute(WidgetRef ref) {
    // DI
    // ViewChanger
    final getQuestionGroupListViewChanger = GetQuestionGroupListViewChanger(
      ref: ref,
    );
    // Repository
    final questionGroupRepository = QuestionGroupRepositoryImpl();
    // Presenter
    final getQuestionGroupListPresenter = GetQuestionGroupListPresenter(
      viewChanger: getQuestionGroupListViewChanger,
    );
    // UseCase
    final getQuestionGroupListUseCase = GetQuestionGroupListUsecase(
      repository: questionGroupRepository,
      presenter: getQuestionGroupListPresenter,
    );
    // Controller
    final getQuestionGroupListController = GetQuestionGroupListController(
      useCase: getQuestionGroupListUseCase,
    );

    // 画面を返却
    return MaterialPageRoute(
      builder: (context) => TrainLineQuestionListScreen(
        getQuestionGroupListcontroller: getQuestionGroupListController,
      ),
    );
  }

  // 路線図問題画面
  MaterialPageRoute _questonRoute(
    WidgetRef ref,
    String questionGroupCode,
    String questionGroupName,
  ) {
    // DI
    // ViewChanger
    final getQuestionListViewChanger = GetQuestionListViewChanger(
      ref: ref,
    );
    // Repository
    // Presenter
    final getQuestionListPresenter = GetQuestionListPresenter(
      viewChanger: getQuestionListViewChanger,
    );
    // UseCase
    final getQuestionListUseCase = GetQuestionListUseCase(
      presenter: getQuestionListPresenter,
    );
    // Controller
    final getQuestionListController = GetQuestionListController(
      useCase: getQuestionListUseCase,
    );

    // 画面を返却
    return MaterialPageRoute(
      builder: (context) => TrainLineQuestionScreen(
        questionGroupCode: questionGroupCode,
        questionGroupName: questionGroupName,
        getQuestionListController: getQuestionListController,
      ),
    );
  }
}
