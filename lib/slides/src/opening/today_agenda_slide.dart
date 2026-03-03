import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

class TodayAgendaSlide extends FlutterDeckSlideWidget {
  const TodayAgendaSlide({super.key})
    : super(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/today-agenda',
          title: '今日話すこと',
          header: FlutterDeckHeaderConfiguration(title: '今日話すこと'),
        ),
      );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const _TodayAgendaSlideContent(),
    );
  }
}

class _TodayAgendaSlideContent extends StatefulWidget {
  const _TodayAgendaSlideContent();

  @override
  State<_TodayAgendaSlideContent> createState() =>
      _TodayAgendaSlideContentState();
}

class _TodayAgendaSlideContentState extends State<_TodayAgendaSlideContent> {
  int _visibleCount = 0;

  void _onTap() {
    setState(() {
      if (_visibleCount < 5) {
        _visibleCount++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 48.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_visibleCount >= 1)
                const Text('🍑 岡山.Flutterとは？', style: TextStyle(fontSize: 32)),
              if (_visibleCount >= 1) const Gap(40),
              if (_visibleCount >= 2)
                const Text('👋 自己紹介', style: TextStyle(fontSize: 32)),
              if (_visibleCount >= 2) const Gap(40),
              if (_visibleCount >= 3)
                const Text('📱 アプリ開発は良いものだぞ', style: TextStyle(fontSize: 32)),
              if (_visibleCount >= 3) const Gap(40),
              if (_visibleCount >= 4)
                const Text('👥 Flutterでつながる', style: TextStyle(fontSize: 32)),
              if (_visibleCount >= 4) const Gap(40),
              if (_visibleCount >= 5)
                const Text('💪 自分ができること', style: TextStyle(fontSize: 32)),
              if (_visibleCount >= 5) const Gap(40),
              if (_visibleCount >= 6)
                const Text('📢 岡山.Flutterの使い方', style: TextStyle(fontSize: 32)),
            ],
          ),
        ),
      ),
    );
  }
}
