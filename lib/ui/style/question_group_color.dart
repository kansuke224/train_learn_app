import 'package:flutter/material.dart';
import 'package:interactive_viewer_01/application/enum/question_group_code.dart';
import 'package:interactive_viewer_01/ui/style/color_scheme/chuo_line_color_schemes.g.dart';
import 'package:interactive_viewer_01/ui/style/color_scheme/imazatosuji_line_color_schemes.g.dart';
import 'package:interactive_viewer_01/ui/style/color_scheme/midosuji_line_color_schemes.g.dart';
import 'package:interactive_viewer_01/ui/style/color_scheme/nagahori_tsurumi_ryokuchi_line_color_schemes.g.dart';
import 'package:interactive_viewer_01/ui/style/color_scheme/sakaisuji_line_color_schemes.g.dart';
import 'package:interactive_viewer_01/ui/style/color_scheme/sennichimae_line_color_schemes.g.dart';
import 'package:interactive_viewer_01/ui/style/color_scheme/tanimachi_line_color_schemes.g.dart';
import 'package:interactive_viewer_01/ui/style/color_scheme/yotsubashi_line_color_schemes.g.dart';

Map<String, ColorScheme> questionGroupColorSchemeMap = {
  QuestionGroupCode.midosujiLine.name: midosujiLineLightColorScheme,
  QuestionGroupCode.tanimachiLine.name: tanimachiLineLightColorScheme,
  QuestionGroupCode.yotsubashiLine.name: yotsubashiLineLightColorScheme,
  QuestionGroupCode.chuoLine.name: chuoLineLightColorScheme,
  QuestionGroupCode.sennichimaeLine.name: sennichimaeLineLightColorScheme,
  QuestionGroupCode.sakaisujiLine.name: sakaisujiLineLightColorScheme,
  QuestionGroupCode.nagahoriTsurumiRyokuchiLine.name: nagahoriTsurumiRyokuchiLineLightColorScheme,
  QuestionGroupCode.imazatosujiLine.name: imazatosujiLineLightColorScheme,
};
