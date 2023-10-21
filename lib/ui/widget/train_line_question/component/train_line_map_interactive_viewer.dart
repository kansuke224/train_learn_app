import 'package:flutter/material.dart';
import 'package:interactive_viewer_01/ui/widget/train_line_question/component/train_line_map.dart';

class TrainLineMapInteractiveViewer extends StatelessWidget {
  TrainLineMapInteractiveViewer({
    super.key,
  });

  final transformationController = TransformationController();
  final xTranslate = 1000.0;
  final yTranslate = 1000.0;

  @override
  Widget build(BuildContext context) {
    // TODO: intiStateにしたほうがいいか？今はリビルドしないから影響ないけど
    transformationController.value.setEntry(0, 3, -xTranslate);
    transformationController.value.setEntry(1, 3, -yTranslate);

    return InteractiveViewer(
      transformationController: transformationController,
      constrained: false,
      maxScale: 5.0,
      minScale: 0.4,
      child: const TrainLineMap(),
    );
  }
}
