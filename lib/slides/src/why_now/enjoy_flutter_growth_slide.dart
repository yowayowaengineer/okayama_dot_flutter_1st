import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

class EnjoyFlutterGrowthSlide extends FlutterDeckSlideWidget {
  const EnjoyFlutterGrowthSlide({super.key})
    : super(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/enjoy-flutter-growth',
          title: 'Flutterの成長を楽しめる',
          header: FlutterDeckHeaderConfiguration(
            title: 'なぜ今なのか（Flutterの成長を楽しめる）',
          ),
        ),
      );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const _EnjoyFlutterGrowthSlideContent(),
    );
  }
}

class _EnjoyFlutterGrowthSlideContent extends StatefulWidget {
  const _EnjoyFlutterGrowthSlideContent();

  @override
  State<_EnjoyFlutterGrowthSlideContent> createState() =>
      _EnjoyFlutterGrowthSlideContentState();
}

class _EnjoyFlutterGrowthSlideContentState
    extends State<_EnjoyFlutterGrowthSlideContent> {
  int _visibleCount = 0; // 表示するテキストの数

  void _onTap() {
    setState(() {
      if (_visibleCount < 3) {
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
                const Text(
                  '👠 Dartのシンデレラストーリー',
                  style: TextStyle(fontSize: 32),
                ),
              if (_visibleCount >= 1) const Gap(40),
              if (_visibleCount >= 2)
                const Text('🔥 状態管理抗争', style: TextStyle(fontSize: 32)),
              if (_visibleCount >= 2) const Gap(40),
              if (_visibleCount >= 3)
                const Text(
                  '💥 Riverpodの破壊的なバージョンアップ',
                  style: TextStyle(fontSize: 32),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
