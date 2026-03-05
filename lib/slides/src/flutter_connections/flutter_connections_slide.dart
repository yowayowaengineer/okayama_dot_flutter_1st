import 'dart:html' as html if (dart.library.html) 'dart:html';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:url_launcher/url_launcher.dart';

class FlutterConnectionsSlide extends FlutterDeckSlideWidget {
  const FlutterConnectionsSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/flutter-connections',
            title: 'Flutterでつながる',
            header: FlutterDeckHeaderConfiguration(title: '👥 Flutterでつながる'),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const _FlutterConnectionsSlideContent(),
    );
  }
}

class _FlutterConnectionsSlideContent extends StatefulWidget {
  const _FlutterConnectionsSlideContent();

  @override
  State<_FlutterConnectionsSlideContent> createState() =>
      _FlutterConnectionsSlideContentState();
}

class _FlutterConnectionsSlideContentState
    extends State<_FlutterConnectionsSlideContent> {
  int _visibleCount = 0;
  /// 2枚目のカード表示アニメーションが終わってから画像を表示する用
  bool _showImage = false;

  static const _gradientArticleUrl =
      'https://qiita.com/azukisiromochi/items/bedf81bae8f0470c58a3';
  static const _slidevUrl = 'https://yowayowa-fav-tool.netlify.app/7';

  /// 画像クリックで2つのURLを別タブで開く
  Future<void> _openGradientArticle() async {
    if (kIsWeb) {
      // 2つ目に開いたタブにフォーカスが当たるので、先に見せたい方を2番目に
      html.window.open(_slidevUrl, '_blank');
      html.window.open(_gradientArticleUrl, '_blank');
    } else {
      for (final urlString in [_slidevUrl, _gradientArticleUrl]) {
        final url = Uri.parse(urlString);
        if (await canLaunchUrl(url)) {
          await launchUrl(url, mode: LaunchMode.platformDefault);
        }
      }
    }
  }

  void _onTap() {
    if (_visibleCount >= 3) return;
    if (_visibleCount == 0) {
      // 1クリック目: 画像透過 → 少し遅れて1枚目のカード表示（ビジョン同様）
      setState(() => _visibleCount = 1);
      Future.delayed(const Duration(milliseconds: 450), () {
        if (mounted) setState(() => _visibleCount = 2);
      });
    } else {
      // 2枚目のカード表示時は、カードの伸びるアニメ(450ms)が終わってから画像を表示
      final willShowSecondCard = _visibleCount == 2;
      setState(() => _visibleCount++);
      if (willShowSecondCard) {
        Future.delayed(const Duration(milliseconds: 550), () {
          if (mounted) setState(() => _showImage = true);
        });
      }
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
    const rowHeight = 96.0;
    const rowGap = 44.0;

    const line1 = '🎉 ルーカスさんがこのイベントに参加してくれた';
    const line2 = '💬 SNSや技術ブログでのやり取り';

    final card1Width = _visibleCount >= 2 ? _textWidth(line1) : 0.0;
    final card2Width = _visibleCount >= 3 ? _textWidth(line2) : 0.0;

    return GestureDetector(
      onTap: _onTap,
      behavior: HitTestBehavior.opaque,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // 背景: 1クリック目で画像の透過度を上げる（ビジョン同様）
          Positioned.fill(
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 400),
              opacity: _visibleCount >= 1 ? 0.5 : 1.0,
              child: Image.asset(
                'assets/images/FlutterKaigi2025.webp',
                fit: BoxFit.contain,
              ),
            ),
          ),
          // 手前: 2行を固定高さで配置し、各スロットでカードが左から右に伸びる
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
                  // リンク付き画像（テキストができってから透過→表示、アプリ開発スライドと同じ）
                  AnimatedOpacity(
                    opacity: _showImage ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 500),
                    child: GestureDetector(
                      onTap: _openGradientArticle,
                      child: MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/images/Flutterグラデーションいろいろ.png',
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return SizedBox(
                                  width: 400,
                                  height: 120,
                                  child: Container(
                                    color: Colors.grey.withOpacity(0.3),
                                    child: const Icon(Icons.image, size: 48),
                                  ),
                                );
                              },
                            ),
                          ),
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

/// 左から右に伸びる白透過カード（ビジョンスライドと同じ）
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
