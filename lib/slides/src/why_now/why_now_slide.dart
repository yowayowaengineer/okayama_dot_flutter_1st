import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';

class WhyNowSlide extends FlutterDeckSlideWidget {
  const WhyNowSlide({super.key})
    : super(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/why-now',
          title: 'なぜ今なのか',
          header: FlutterDeckHeaderConfiguration(title: 'なぜ今なのか（環境）'),
        ),
      );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const _WhyNowSlideContent(),
    );
  }
}

class _WhyNowSlideContent extends StatefulWidget {
  const _WhyNowSlideContent();

  @override
  State<_WhyNowSlideContent> createState() => _WhyNowSlideContentState();
}

class _WhyNowSlideContentState extends State<_WhyNowSlideContent> {
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
                Row(
                  children: [
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.blue[700],
                      size: 24,
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        'コンテストでFlutterを継続的に学習する人は生まれたものの（岡山で）Flutterのお仕事がなかった',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              if (_visibleCount >= 1) const Gap(40),
              if (_visibleCount >= 2)
                Row(
                  children: [
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.blue[700],
                      size: 32,
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        '新型コロナウイルスの登場以降、フルリモート案件が増えFlutterのお仕事ができるようになった',
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                  ],
                ),
              if (_visibleCount >= 2) const Gap(40),
              if (_visibleCount >= 3)
                Row(
                  children: [
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.blue[700],
                      size: 40,
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        '自身としてFlutterの実績ができたので、またあの時（コンテストの時）のように仲間を作って盛り上げていきたい',
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
