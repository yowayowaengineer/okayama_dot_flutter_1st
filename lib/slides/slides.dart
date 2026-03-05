import 'package:flutter_deck/flutter_deck.dart';
import 'package:okayama_dot_flutter_1st/slides/src/app_dev/app_dev_slide.dart';
import 'package:okayama_dot_flutter_1st/slides/src/closing/ending_slide.dart';
import 'package:okayama_dot_flutter_1st/slides/src/me/who_am_i_1_slide.dart';
import 'package:okayama_dot_flutter_1st/slides/src/opening/icebreak_slide.dart';
import 'package:okayama_dot_flutter_1st/slides/src/opening/today_agenda_slide.dart';
import 'package:okayama_dot_flutter_1st/slides/src/vision/vision_slide.dart';

List<FlutterDeckSlideWidget> get slides => [
  // オープニング
  const IcebreakSlide(),
  const TodayAgendaSlide(),

  // ビジョン
  const VisionSlide(),

  // 自己紹介
  const WhoAmISlide1(),

  // アプリ開発は良いものだぞ
  const AppDevSlide(),

  // クロージング
  const EndingSlide(),
];
