import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/application/use_case/answer_question_use_case.dart';
import 'package:interactive_viewer_01/application/use_case/get_entire_answer_result_use_case.dart';
import 'package:interactive_viewer_01/application/use_case/get_question_group_list_use_case.dart';
import 'package:interactive_viewer_01/application/use_case/get_question_list_use_case.dart';
import 'package:interactive_viewer_01/data/repository/question_group_repository_impl.dart';
import 'package:interactive_viewer_01/presentation/controller/answer_question_controller.dart';
import 'package:interactive_viewer_01/presentation/controller/get_entire_answer_result_controller.dart';
import 'package:interactive_viewer_01/presentation/controller/get_question_group_list_controller.dart';
import 'package:interactive_viewer_01/presentation/controller/get_question_list_controller.dart';
import 'package:interactive_viewer_01/presentation/presenter/answer_question_presenter.dart';
import 'package:interactive_viewer_01/presentation/presenter/get_entire_answer_result_presenter.dart';
import 'package:interactive_viewer_01/presentation/presenter/get_question_group_list_presenter.dart';
import 'package:interactive_viewer_01/presentation/presenter/get_question_list_presenter.dart';
import 'package:interactive_viewer_01/presentation/view_model/get_question_group_list_view_model.dart';
import 'package:interactive_viewer_01/ui/provider/di/answer_question_controller_provider.dart';
import 'package:interactive_viewer_01/ui/provider/di/get_entire_answer_result_controller_provider.dart';
import 'package:interactive_viewer_01/ui/view_changer/answer_question_view_changer.dart';
import 'package:interactive_viewer_01/ui/view_changer/get_entire_answer_result_view_changer.dart';
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
            // initialRoute: "/",
            // routes: {
            //   "/": (context) => _getTrainLineQuestionListScreen(ref),
            //   "/question": (context) => _getTrainLineQuestionScreen(ref),
            // },
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
    final getQuestionGroupListViewChanger = GetQuestionGroupListViewChanger(ref: ref);
    // Repository
    final questionGroupRepository = QuestionGroupRepositoryImpl();
    // Presenter
    final getQuestionGroupListPresenter = GetQuestionGroupListPresenter(
      viewChanger: getQuestionGroupListViewChanger,
    );
    // UseCase
    final getQuestionGroupListUseCase = GetQuestionGroupListUseCase(
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
    final getQuestionListViewChanger = GetQuestionListViewChanger(ref: ref);
    final answerQuestionViewChanger = AnswerQuestionViewChanger(ref: ref);
    final getEntireAnswerResultViewChanger = GetEntireAnswerResultViewChanger(ref: ref);
    // Repository
    final questionGroupRepository = QuestionGroupRepositoryImpl();
    // Presenter
    final getQuestionListPresenter = GetQuestionListPresenter(
      viewChanger: getQuestionListViewChanger,
    );
    final answerQuestionPresenter = AnswerQuestionPresenter(
      viewChanger: answerQuestionViewChanger,
    );
    final getEntireAnswerResultPresenter = GetEntireAnswerResultPresenter(
      viewChanger: getEntireAnswerResultViewChanger,
    );
    // UseCase
    final getQuestionListUseCase = GetQuestionListUseCase(
      presenter: getQuestionListPresenter,
    );
    final answerQuestionUseCase = AnswerQuestionUseCase(
      presenter: answerQuestionPresenter,
    );
    final getEntireAnswerResultUseCase = GetEntireAnswerResultUseCase(
      repository: questionGroupRepository,
      presenter: getEntireAnswerResultPresenter,
    );
    // Controller
    final getQuestionListController = GetQuestionListController(
      useCase: getQuestionListUseCase,
    );
    final answerQuestionController = AnswerQuestionController(
      useCase: answerQuestionUseCase,
    );
    final getEntireAnswerResultController = GetEntireAnswerResultController(
      useCase: getEntireAnswerResultUseCase,
    );
    ref.read(answerQuestionControllerProvider.notifier).state = answerQuestionController;
    ref.read(getEntireAnswerResultControllerProvider.notifier).state = getEntireAnswerResultController;

    // 画面を返却
    return MaterialPageRoute(
      settings: const RouteSettings(name: "/question"),
      builder: (context) => TrainLineQuestionScreen(
        questionGroupCode: questionGroupCode,
        questionGroupName: questionGroupName,
        getQuestionListController: getQuestionListController,
      ),
    );
  }
}
