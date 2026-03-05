import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class VisionSlide extends FlutterDeckSlideWidget {
  const VisionSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/vision',
            title: '岡山.Flutterとは？',
            header: FlutterDeckHeaderConfiguration(
              title: '🍑 岡山.Flutterとは？',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const _VisionSlideContent(),
    );
  }
}

class _VisionSlideContent extends StatefulWidget {
  const _VisionSlideContent();

  @override
  State<_VisionSlideContent> createState() => _VisionSlideContentState();
}

class _VisionSlideContentState extends State<_VisionSlideContent> {
  int _visibleCount = 0;

  void _onTap() {
    if (_visibleCount >= 4) return;
    if (_visibleCount == 0) {
      // 1クリック目: 画像透過 → 少し遅れて1枚目のカード表示（クリック数削減）
      setState(() => _visibleCount = 1);
      Future.delayed(const Duration(milliseconds: 450), () {
        if (mounted) setState(() => _visibleCount = 2);
      });
    } else {
      setState(() => _visibleCount++);
    }
  }

  static const _cardTextStyle = TextStyle(fontSize: 32);
  static const _cardHorizontalPadding = 28.0;
  /// 右端の文字が切れないよう横幅に加える余白
  static const _cardWidthBuffer = 32.0;

  double _textWidth(String text) {
    final painter = TextPainter(
      text: TextSpan(text: text, style: _cardTextStyle),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return painter.width + _cardHorizontalPadding * 2 + _cardWidthBuffer;
  }

  @override
  Widget build(BuildContext context) {
    const horizontalPadding = 80.0;
    const rowHeight = 96.0; // カード内の文字（fontSize 32）が切れない高さ
    const rowGap = 44.0;   // 3カードを縦に広く配置

    const line1 = '🌱 これから始める人の個人開発・モチベ維持の場';
    const line2 = '👫 同じような目線・目的の人が集まって切磋琢磨する場';
    const line3 = '🗺 地方から Flutter を広げていく場';

    // 1クリック目で背景暗く、2クリック目〜でカード表示
    final card1Width = _visibleCount >= 2 ? _textWidth(line1) : 0.0;
    final card2Width = _visibleCount >= 3 ? _textWidth(line2) : 0.0;
    final card3Width = _visibleCount >= 4 ? _textWidth(line3) : 0.0;

    return GestureDetector(
      onTap: _onTap,
      behavior: HitTestBehavior.opaque,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // 背景: オープニング画像（1クリック目で画像自体を透過してインパクトを抑える）
          Positioned.fill(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: _visibleCount >= 1 ? 0.5 : 1.0,
              child: Image.asset(
                'assets/images/icebreak.jpg',
                fit: BoxFit.contain,
              ),
            ),
          ),
          // 手前: 3行を固定高さで配置し、各スロットでカードが左から右に伸びる
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: rowHeight,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: _ExpandingCard(
                        cardWidth: card1Width,
                        child: const Text(
                          line1,
                          style: _cardTextStyle,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: rowGap),
                  SizedBox(
                    height: rowHeight,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: _ExpandingCard(
                        cardWidth: card2Width,
                        child: const Text(
                          line2,
                          style: _cardTextStyle,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: rowGap),
                  SizedBox(
                    height: rowHeight,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: _ExpandingCard(
                        cardWidth: card3Width,
                        child: const Text(
                          line3,
                          style: _cardTextStyle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 左から右に伸びる白透過カード
class _ExpandingCard extends StatelessWidget {
  const _ExpandingCard({
    required this.cardWidth,
    required this.child,
  });

  final double cardWidth;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeOutCubic,
        width: cardWidth,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.88),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.centerLeft,
          child: child,
        ),
      ),
    );
  }
}
