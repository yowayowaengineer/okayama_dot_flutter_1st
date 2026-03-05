import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class HowToUseSlide extends FlutterDeckSlideWidget {
  const HowToUseSlide({super.key})
    : super(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/how-to-use',
          title: '岡山.Flutterの使い方',
          header: FlutterDeckHeaderConfiguration(title: '📢 岡山.Flutterの使い方'),
        ),
      );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const _HowToUseSlideContent(),
    );
  }
}

class _HowToUseSlideContent extends StatefulWidget {
  const _HowToUseSlideContent();

  @override
  State<_HowToUseSlideContent> createState() => _HowToUseSlideContentState();
}

class _HowToUseSlideContentState extends State<_HowToUseSlideContent> {
  int _visibleCount = 0;

  void _onTap() {
    setState(() {
      if (_visibleCount < 4) {
        _visibleCount++;
      }
    });
  }

  static const _itemStyle = TextStyle(fontSize: 32);
  static const _rowHeight = 56.0;
  static const _rowGap = 32.0;
  static const _imageSlotSize = 200.0;

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
                        ? const Text(
                            '🎤 セッションのある本イベントを3カ月に1回（3月・6月・9月・12月に開催）',
                            style: _itemStyle,
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
                const SizedBox(height: _rowGap),
                SizedBox(
                  height: _rowHeight,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: _visibleCount >= 2
                        ? const Text(
                            '☕ 「LT・もくもく会」を本イベントの合間に、1カ月に1回（本イベントの月以外に開催）',
                            style: _itemStyle,
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
                const SizedBox(height: _rowGap),
                SizedBox(
                  height: _rowHeight,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: _visibleCount >= 3
                        ? const Text(
                            '🐕 ステッカーの種類について（レア枠……だと）',
                            style: _itemStyle,
                          )
                        : const SizedBox.shrink(),
                  ),
                ),
                const SizedBox(height: 48),
                // 画像エリアは高さを確保して中央に固定（3つ目のテキスト表示後にフェードイン）
                SizedBox(
                  height: _imageSlotSize,
                  child: Center(
                    child: AnimatedOpacity(
                      opacity: _visibleCount >= 3 ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 400),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/ステッカー1.png',
                              width: _imageSlotSize,
                              height: _imageSlotSize,
                              fit: BoxFit.contain,
                              errorBuilder: (_, __, ___) => Container(
                                width: _imageSlotSize,
                                height: _imageSlotSize,
                                color: Colors.grey.withOpacity(0.2),
                                child: Icon(
                                  Icons.image_outlined,
                                  size: 48,
                                  color: Colors.grey.withOpacity(0.6),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 32),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              'assets/images/ステッカー2.png',
                              width: _imageSlotSize,
                              height: _imageSlotSize,
                              fit: BoxFit.contain,
                              errorBuilder: (_, __, ___) => Container(
                                width: _imageSlotSize,
                                height: _imageSlotSize,
                                color: Colors.grey.withOpacity(0.2),
                                child: Icon(
                                  Icons.image_outlined,
                                  size: 48,
                                  color: Colors.grey.withOpacity(0.6),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                AnimatedOpacity(
                  opacity: _visibleCount >= 4 ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 400),
                  child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0),
                      child: Text(
                        '登壇（ぜひ喋って！）・運営（ぜひ入って！）・LT・もくもく会参加（遊びに来てね！）',
                        style: _itemStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
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
