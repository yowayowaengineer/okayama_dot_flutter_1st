import 'package:flutter/material.dart';
import 'package:flutter_deck/flutter_deck.dart';

class FlutterGrowthSlide extends FlutterDeckSlideWidget {
  const FlutterGrowthSlide({super.key})
    : super(
        configuration: const FlutterDeckSlideConfiguration(
          route: '/flutter-growth',
          title: 'Flutterの成長',
          header: FlutterDeckHeaderConfiguration(title: 'Flutterの成長'),
        ),
      );

  @override
  FlutterDeckSlide build(BuildContext context) {
    return FlutterDeckSlide.blank(
      builder: (context) => Padding(
        padding: const EdgeInsets.all(80.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 150.0),
                child: Center(child: _buildStatsGrid(context)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsGrid(BuildContext context) {
    final stats = _getStats();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: _buildStatCard(context, stats[0]),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: _buildStatCard(context, stats[1]),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: _buildStatCard(context, stats[2]),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: _buildStatCard(context, stats[3]),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatCard(BuildContext context, StatData stat) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(color: Colors.blue[200]!, width: 2.0),
      ),
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(stat.icon, size: 40, color: Colors.blue[700]),
          const SizedBox(height: 16),
          Text(
            stat.value,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.blue[700],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            stat.label,
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }

  List<StatData> _getStats() {
    return [
      StatData(icon: Icons.star, value: '174k', label: 'GitHubスター'),
      StatData(
        icon: Icons.download,
        value: '30%+',
        label: 'App Storeの無料アプリにおけるFlutter製アプリの割合',
      ),
      StatData(icon: Icons.people, value: '200万+', label: '月間アクティブ開発者数'),
      StatData(
        icon: Icons.extension,
        value: '50,000+',
        label: 'Flutterのパッケージ数',
      ),
    ];
  }
}

class StatData {
  final IconData icon;
  final String value;
  final String label;

  const StatData({
    required this.icon,
    required this.value,
    required this.label,
  });
}
