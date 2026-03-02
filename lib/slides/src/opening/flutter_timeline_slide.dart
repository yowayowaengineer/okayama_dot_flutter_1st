import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';
import 'package:timelines_plus/timelines_plus.dart';

class FlutterTimelineSlide extends FlutterDeckSlideWidget {
  const FlutterTimelineSlide({super.key})
    : super(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/flutter-timeline',
          title: 'Flutter年表',
          header: FlutterDeckHeaderConfiguration(title: 'Flutterの軌跡'),
        ),
      );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 120.0, vertical: 80.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // 左側にロゴを配置
            Center(child: FlutterLogo(size: 350.0)),
            // 右側にタイムライン（
            Flexible(child: _buildTimeline(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeline(BuildContext context) {
    final events = _getFlutterEvents();

    return FixedTimeline.tileBuilder(
      builder: TimelineTileBuilder.connectedFromStyle(
        connectionDirection: ConnectionDirection.before,
        connectorStyleBuilder: (context, index) {
          return (index <= 1)
              ? ConnectorStyle.dashedLine
              : ConnectorStyle.solidLine;
        },
        indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
        itemExtent: 80.0,
        itemCount: events.length,
        contentsBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 4.0, right: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  events[index].date,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[700],
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  events[index].description,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(fontSize: 20),
                  softWrap: false,
                  overflow: TextOverflow.clip,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  List<FlutterEvent> _getFlutterEvents() {
    return [
      const FlutterEvent(date: '2015年', description: 'プロジェクト「Sky」としてスタート'),
      const FlutterEvent(date: '2017年5月', description: 'Google I/Oでアルファ版を発表'),
      const FlutterEvent(date: '2018年12月', description: 'Flutter 1.0 正式リリース'),
      const FlutterEvent(
        date: '2021年3月',
        description: 'Flutter 2.0 リリース（Web、デスクトップ対応）',
      ),
      const FlutterEvent(
        date: '2022年5月',
        description: 'Flutter 3.0 リリース（Windows、macOS、Linux正式サポート）',
      ),
      const FlutterEvent(
        date: '2024年5月',
        description: 'Flutter 3.22 リリース（Impeller、Wasm対応強化）',
      ),
      const FlutterEvent(
        date: '2024年11月',
        description: 'Flutter 3.27 リリース（最新安定版）',
      ),
    ];
  }
}

class FlutterEvent {
  final String date;
  final String description;

  const FlutterEvent({required this.date, required this.description});
}
