import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class TodayAgendaSlide extends FlutterDeckSlideWidget {
  const TodayAgendaSlide({super.key})
    : super(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/today-agenda',
          title: '今日話すこと',
          header: FlutterDeckHeaderConfiguration(title: '📋今日話すこと'),
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
      if (_visibleCount < 6) {
        _visibleCount++;
      }
    });
  }

  static const _itemStyle = TextStyle(fontSize: 32);
  static const _rowHeight = 56.0;
  static const _rowGap = 32.0;

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
          padding: const EdgeInsets.symmetric(horizontal: 80.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: _rowHeight,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: _visibleCount >= 1
                        ? const Text('🍑 岡山.Flutterとは？', style: _itemStyle)
                        : const SizedBox.shrink(),
                  ),
                ),
                const SizedBox(height: _rowGap),
                SizedBox(
                  height: _rowHeight,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: _visibleCount >= 2
                        ? const Text('👋 自己紹介', style: _itemStyle)
                        : const SizedBox.shrink(),
                  ),
                ),
                const SizedBox(height: _rowGap),
                SizedBox(
                  height: _rowHeight,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: _visibleCount >= 3
                        ? const Text('📱 アプリ開発は良いものだぞ', style: _itemStyle)
                        : const SizedBox.shrink(),
                  ),
                ),
                const SizedBox(height: _rowGap),
                SizedBox(
                  height: _rowHeight,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: _visibleCount >= 4
                        ? const Text('👥 Flutterでつながる', style: _itemStyle)
                        : const SizedBox.shrink(),
                  ),
                ),
                const SizedBox(height: _rowGap),
                SizedBox(
                  height: _rowHeight,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: _visibleCount >= 5
                        ? const Text('💪 自分ができること', style: _itemStyle)
                        : const SizedBox.shrink(),
                  ),
                ),
                const SizedBox(height: _rowGap),
                SizedBox(
                  height: _rowHeight,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: _visibleCount >= 6
                        ? const Text('📢 岡山.Flutterの使い方', style: _itemStyle)
                        : const SizedBox.shrink(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
