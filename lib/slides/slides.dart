import 'package:flutter_deck/flutter_deck.dart';
import 'package:okayama_dot_flutter_1st/slides/src/announcement/announcement_slide.dart';
import 'package:okayama_dot_flutter_1st/slides/src/announcement/recruitment_slide.dart';
import 'package:okayama_dot_flutter_1st/slides/src/closing/ending_slide.dart';
import 'package:okayama_dot_flutter_1st/slides/src/community/our_community_1_slide.dart';
import 'package:okayama_dot_flutter_1st/slides/src/community/our_community_2_slide.dart';
import 'package:okayama_dot_flutter_1st/slides/src/community/our_community_3_slide.dart';
import 'package:okayama_dot_flutter_1st/slides/src/contest/contest_purpose_slide.dart';
import 'package:okayama_dot_flutter_1st/slides/src/contest/flutter_app_contest_slide.dart';
import 'package:okayama_dot_flutter_1st/slides/src/me/who_am_i_1_slide.dart';
import 'package:okayama_dot_flutter_1st/slides/src/me/who_am_i_2_slide.dart';
import 'package:okayama_dot_flutter_1st/slides/src/me/who_am_i_3_slide.dart';
import 'package:okayama_dot_flutter_1st/slides/src/me/who_am_i_4_slide.dart';
import 'package:okayama_dot_flutter_1st/slides/src/opening/icebreak_slide.dart';
import 'package:okayama_dot_flutter_1st/slides/src/opening/today_agenda_slide.dart';
import 'package:okayama_dot_flutter_1st/slides/src/why_now/enjoy_flutter_growth_slide.dart';
import 'package:okayama_dot_flutter_1st/slides/src/why_now/talent_existence_slide.dart';
import 'package:okayama_dot_flutter_1st/slides/src/why_now/why_now_slide.dart';

List<FlutterDeckSlideWidget> get slides => [
  // オープニング
  const IcebreakSlide(),
  const TodayAgendaSlide(),

  // 自己紹介
  const WhoAmISlide1(),
  const WhoAmISlide2(),
  const WhoAmISlide3(),
  const WhoAmISlide4(),

  // コンテスト
  const FlutterAppContestSlide(),
  const ContestPurposeSlide(),

  // なぜ今なのか
  const WhyNowSlide(),
  const EnjoyFlutterGrowthSlide(),
  const TalentExistenceSlide(),

  // コミュニティ
  const OurCommunity1Slide(),
  const OurCommunity2Slide(),
  const OurCommunity3Slide(),

  // 告知
  const AnnouncementSlide(),
  const RecruitmentSlide(),

  // クロージング
  const EndingSlide(),
];
