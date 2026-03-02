import 'dart:html' as html if (dart.library.html) 'dart:html';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:gap/gap.dart';
import 'package:url_launcher/url_launcher.dart';

class RecruitmentSlide extends FlutterDeckSlideWidget {
  const RecruitmentSlide({super.key})
      : super(
          configuration: const FlutterDeckSlideConfiguration(
            route: '/recruitment',
            title: '運営募集中',
            header: FlutterDeckHeaderConfiguration(title: '運営募集中！'),
          ),
        );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => const _RecruitmentSlideContent(),
    );
  }
}

class _RecruitmentSlideContent extends StatelessWidget {
  const _RecruitmentSlideContent();

  Future<void> _openUrl() async {
    final urlString = 'https://discord.gg/x4bgEnSM';
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
          // 左側: 画像とテキスト
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 画像
                Center(
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 400,
                      maxHeight: 400,
                    ),
                    child: Image.asset(
                      'assets/images/enjin_circle_wakamono.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const Gap(32),
                // テキスト
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
                        '現在はコンテストで集まったFlutter仲間で立案、準備をしています',
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
                      size: 32,
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        '第1回に向けて運営メンバーも募集したいです！',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 32),
          // 右側: リンク付き画像（クリック可能）
          Expanded(
            flex: 1,
            child: Center(
              child: GestureDetector(
                onTap: _openUrl,
                child: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    constraints: const BoxConstraints(
                      maxWidth: 500,
                      maxHeight: 500,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/QR_discord.png',
                        fit: BoxFit.contain,
                      ),
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
