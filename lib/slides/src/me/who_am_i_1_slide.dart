import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class WhoAmISlide1 extends FlutterDeckSlideWidget {
  const WhoAmISlide1({super.key})
    : super(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/who-am-i-1',
          title: '自己紹介',
          header: FlutterDeckHeaderConfiguration(title: '👋よわよわエンジニア is 誰'),
        ),
      );

  @override
  FlutterDeckSlide build(BuildContext context) {
    final GlobalKey targetKey = GlobalKey();

    void showTutorial() {
      final targets = [
        TargetFocus(
          identify: "person",
          keyTarget: targetKey,
          contents: [
            TargetContent(
              align: ContentAlign.bottom,
              builder: (context, controller) {
                return Container(
                  constraints: const BoxConstraints(maxWidth: 400),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 15,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // プロフィール画像（円形）
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(
                          'assets/images/me_400x400.jpg',
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16),
                      // テキスト情報
                      SizedBox(
                        width: 400,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // 名前
                            Text(
                              'よわよわエンジニア',
                              style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[700],
                              ),
                            ),
                            const SizedBox(height: 6),
                            // 説明
                            Text(
                              '🍩☕',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),
                            ),
                            const SizedBox(height: 8),
                            // SNSハンドル
                            Row(
                              children: [
                                // 旧Twitterアイコン（絵文字を使用）
                                Text('🐦', style: TextStyle(fontSize: 16)),
                                const SizedBox(width: 4),
                                Text(
                                  '@yowayowa_engr',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.blue[600],
                                    decoration: TextDecoration.none, // 下線を削除
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
          shape: ShapeLightFocus.Circle,
        ),
      ];

      TutorialCoachMark(
        targets: targets,
        colorShadow: Colors.black.withOpacity(0.8),
        textSkip: "閉じる",
        paddingFocus: 10,
        opacityShadow: 0.8,
        onFinish: () {
          // チュートリアル終了時の処理
        },
      ).show(context: context);
    }

    return FlutterDeckSlide.blank(
      builder: (context) => GestureDetector(
        onTap: showTutorial,
        child: Stack(
          children: [
            // 背景画像
            Image.asset(
              'assets/images/FlutterKaigi2025.webp',
              fit: BoxFit.contain,
              width: double.infinity,
              height: double.infinity,
            ),
            // ターゲット位置を示す透明なウィジェット
            Positioned(
              left: 967.w, // flutter_screenutilでスケール
              top: 528.h, // flutter_screenutilでスケール
              child: SizedBox(
                key: targetKey,
                width: 40.w,
                height: 40.h,
                // 透明だが、tutorial_coach_markがターゲットとして認識できる
              ),
            ),
          ],
        ),
      ),
    );
  }
}
