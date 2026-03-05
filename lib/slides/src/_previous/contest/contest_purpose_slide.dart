import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class ContestPurposeSlide extends FlutterDeckSlideWidget {
  const ContestPurposeSlide({super.key})
    : super(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/contest-purpose',
          title: 'コンテストを企画した目的',
          header: FlutterDeckHeaderConfiguration(title: 'コンテストを企画した目的'),
        ),
      );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const _ContestPurposeSlideContent(),
    );
  }
}

class _ContestPurposeSlideContent extends StatefulWidget {
  const _ContestPurposeSlideContent();

  @override
  State<_ContestPurposeSlideContent> createState() =>
      _ContestPurposeSlideContentState();
}

class _ContestPurposeSlideContentState
    extends State<_ContestPurposeSlideContent> {
  int _step = 0; // 0: 非表示, 1: テキスト, 2: 画像

  void _onTap() {
    setState(() {
      if (_step < 2) {
        _step++;
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
        child: Center(
          child: _step == 1
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80.0),
                  child: Text(
                    '賞金が欲しい！',
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 120,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[700],
                      height: 1.2,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )
              : _step == 2
              ? Transform.rotate(
                  angle: -0.15, // 右肩上がりに傾ける（負の値で反転）
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 1500,
                      maxHeight: 1500,
                    ),
                    child: Image.asset(
                      'assets/images/i_love_money.webp',
                      fit: BoxFit.contain,
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ),
    );
  }
}
