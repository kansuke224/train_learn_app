import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:interactive_viewer_01/ui/question_group_list_screen/question_group_list_screen.dart';
import 'package:interactive_viewer_01/ui/route_map_screen.dart';

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
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        debugShowCheckedModeBanner: false,
        home: const QuestionGroupListScreen(),
      ),
    );
  }
}
