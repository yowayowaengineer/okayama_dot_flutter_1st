import 'dart:html' as html if (dart.library.html) 'dart:html';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class WhoAmISlide4 extends FlutterDeckSlideWidget {
  const WhoAmISlide4({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/who-am-i-4',
            title: '自己紹介④',
            header: FlutterDeckHeaderConfiguration(
              title: 'よわよわエンジニア is 誰 (コミュニティな話)',
            ),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const _WhoAmISlide4Content(),
    );
  }
}

class _WhoAmISlide4Content extends StatelessWidget {
  const _WhoAmISlide4Content();

  Future<void> _openUrl() async {
    final urlString = 'https://okayama.open-seminar.org/';
    if (kIsWeb) {
      html.window.open(urlString, '_blank');
    } else {
      final url = Uri.parse(urlString);
      if (await canLaunchUrl(url)) {
        await launchUrl(url, mode: LaunchMode.platformDefault);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80.0, vertical: 48.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 左側: テキスト
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                        '最近エンジニアコミュニティに参加するようになった（できるようになった）',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
                const Gap(24),
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
                        'OSOの運営に入ったことで視野が広がった',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
                const Gap(40),
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
                        'なにか自分でもコミュニティを立ち上げたい！',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
                const Gap(24),
                Padding(
                  padding: const EdgeInsets.only(left: 32.0),
                  child: Text.rich(
                    TextSpan(
                      style: const TextStyle(fontSize: 24),
                      children: const [
                        TextSpan(text: '🚀 自分の中でのコミュニティに対する関わりは '),
                        TextSpan(
                          text: 'Flutterアプリコンテスト',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: ' がきっかけ'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 32),
          // 右側: 画像（クリック可能）
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: _openUrl,
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
                      'assets/images/oso.webp',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
