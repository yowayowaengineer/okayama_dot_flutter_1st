import 'package:flutter_deck/flutter_deck.dart';
import 'package:okayama_dot_flutter_1st/slides/src/closing/ending_slide.dart';
import 'package:okayama_dot_flutter_1st/slides/src/me/who_am_i_1_slide.dart';
import 'package:okayama_dot_flutter_1st/slides/src/me/who_am_i_2_slide.dart';
import 'package:okayama_dot_flutter_1st/slides/src/me/who_am_i_3_slide.dart';
import 'package:okayama_dot_flutter_1st/slides/src/me/who_am_i_4_slide.dart';
import 'package:okayama_dot_flutter_1st/slides/src/opening/icebreak_slide.dart';
import 'package:okayama_dot_flutter_1st/slides/src/opening/today_agenda_slide.dart';

List<FlutterDeckSlideWidget> get slides => [
  // オープニング
  const IcebreakSlide(),
  const TodayAgendaSlide(),

  // ビジョン（vision/）・アプリ開発（app_dev/）・つながり（flutter_connections/）
  // 自分ができること（what_i_can_do/）・使い方（how_to_use/）はこれから追加

  // 自己紹介
  const WhoAmISlide1(),
  const WhoAmISlide2(),
  const WhoAmISlide3(),
  const WhoAmISlide4(),

  // クロージング
  const EndingSlide(),
];
