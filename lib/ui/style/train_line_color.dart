import 'dart:ui';

import 'package:interactive_viewer_01/application/enum/train_line_code.dart';
import 'package:interactive_viewer_01/ui/style/custom_color.dart';

Map<String, Color> trainLineColorMap = {
  TrainLineCode.midosujiLine.name: CustomColor.midosujiLineColor,
  TrainLineCode.tanimachiLine.name: CustomColor.tanimachiLineColor,
  TrainLineCode.chuoLine.name: CustomColor.chuoLineColor,
  TrainLineCode.yotsubashiLine.name: CustomColor.yotsubashiLineColor,
  TrainLineCode.sennichimaeLine.name: CustomColor.sennichimaeLineColor,
  TrainLineCode.sakaisujiLine.name: CustomColor.sakaisujiLineColor,
  TrainLineCode.nagahoriTsurumiRyokuchiLine.name: CustomColor.nagahoriTsurumiRyokuchiLineColor,
  TrainLineCode.imazatosujiLine.name: CustomColor.imazatosujiLineColor,
};
