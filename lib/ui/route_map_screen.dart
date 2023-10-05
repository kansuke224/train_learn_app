import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/enum/station_code.dart';
import 'package:interactive_viewer_01/model/station.dart';
import 'package:interactive_viewer_01/state/correct_answer_count_provider.dart';
import 'package:interactive_viewer_01/state/question_staion_map_provider.dart';
import 'package:interactive_viewer_01/state/select_station_provider.dart';

class RouteMapScreen extends StatelessWidget {
  const RouteMapScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // const zoomFactor = 1.0;
    const xTranslate = 1000.0;
    const yTranslate = 1000.0;

    var transformationController = TransformationController();
    // transformationController.value.setEntry(0, 0, zoomFactor);
    // transformationController.value.setEntry(1, 1, zoomFactor);
    // transformationController.value.setEntry(2, 2, zoomFactor);
    transformationController.value.setEntry(0, 3, -xTranslate);
    transformationController.value.setEntry(1, 3, -yTranslate);

    return Scaffold(
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
          Positioned(
            left: 15,
            top: 30,
            child: Container(
              width: 80,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Consumer(
                  builder: (context, ref, child) {
                    int correctAnswerCount = ref.watch(correctAnswerCountProvider);
                    return Text('正答数 : $correctAnswerCount');
                  },
                ),
              ),
            ),
          ),
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
    return Stack(
      children: [
        // 背景路線図
        Positioned(
          child: SvgPicture.asset(
            'assets/路線図(背景用).svg',
            height: 3000,
          ),
        ),
        for (final stationProvider in ref.read(questionStationMapProvider).values)
          Consumer(
            builder: (context, ref, child) {
              // 駅情報取得
              final station = ref.watch(stationProvider);
              return Positioned(
                top: station.getPosition().dy,
                left: station.getPosition().dx,
                child: StationButton(station: station),
              );
            },
          ),
      ],
    );
  }
}

class StationButton extends ConsumerWidget {
  const StationButton({
    super.key,
    required this.station,
  });

  final Station station;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: station.width,
      height: station.height,
      child: OutlinedButton(
        onPressed: () => handleOnPressed(context, ref),
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                station.borderRadius,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          side: BorderSide(
            color: station.color,
            width: 1.0,
          ),
        ),
        child: const Text(''),
      ),
    );
  }

  // 駅押下時の処理
  handleOnPressed(BuildContext context, WidgetRef ref) {
    final stationMap = ref.read(questionStationMapProvider);
    // 現在選択中の駅があれば、未選択の状態へ更新
    StationCode selectedStationCode = ref.read(selectStationProvider.notifier).state;
    if (selectedStationCode != StationCode.empty) {
      ref.read(stationMap[selectedStationCode]!.notifier).setIsSelected(false);
    }
    // 選択中のStationCodeを更新
    ref.read(selectStationProvider.notifier).state = station.stationCode;
    // 選択した駅について、選択中の状態へ更新
    ref.read(stationMap[station.stationCode]!.notifier).setIsSelected(true);
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
        return const BottomSheetContent();
      },
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
      child: SizedBox(
        height: 200,
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
    final stationMap = ref.read(questionStationMapProvider);
    StationCode selectedStationCode = ref.read(selectStationProvider.notifier).state;
    Station station = ref.read(stationMap[selectedStationCode]!);
    return Row(
      children: [
        for (int i = 0; i < station.trainLineList.length; i++)
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: station.trainLineList[i].color,
                ),
                child: Text(
                  station.shortNameList[i],
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                station.trainLineList[i].name,
                style: TextStyle(
                  color: station.trainLineList[i].color,
                ),
              ),
            ],
          )
      ],
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
    // 選択中の駅情報
    final stationMap = ref.read(questionStationMapProvider);
    StationCode selectedStationCode = ref.read(selectStationProvider.notifier).state;
    Station station = ref.read(stationMap[selectedStationCode]!);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Consumer(
          builder: (context, ref, child) {
            // 解答済みかどうか
            bool isAnswred = ref.watch(
              stationMap[selectedStationCode]!.select((station) => station.isAnswred),
            );
            // 解答後
            return isAnswred
                ? Text(
                    '正解 「${station.name}」駅',
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
          onPressed: () => handleOk(context, ref, station),
          child: const Text('OK'),
        ),
      ],
    );
  }

  // OKボタン押下時
  void handleOk(
    BuildContext context,
    WidgetRef ref,
    Station station,
  ) {
    // 解答を判定
    bool answerResult = station.answer(answerNameController.text);
    // 駅を解答済み状態へ変更
    final stationMap = ref.read(questionStationMapProvider);
    StationCode selectedStationCode = ref.read(selectStationProvider.notifier).state;
    ref.read(stationMap[selectedStationCode]!.notifier).setAnswerd();
    // 正解の場合は正答数を更新
    if (answerResult) {
      ref.read(correctAnswerCountProvider.notifier).state = ref.read(correctAnswerCountProvider) + 1;
    }

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

    // 0.5秒後に正解・不正解を非表示
    Future.delayed(const Duration(milliseconds: 500), () {
      // テキストフィールドのフォーカスを外す(ダイアログを閉じる前にキーボードを消すため)
      FocusManager.instance.primaryFocus?.unfocus();
      // 正解・不正解を非表示
      Navigator.of(context).pop();
      // 正解であればボトムシートも非表示
      if (answerResult) Navigator.of(context).pop();
    });
  }
}
