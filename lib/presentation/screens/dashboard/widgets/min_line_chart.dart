import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class MiniLineChart extends StatelessWidget {
  final List<double> dataPoints;

  const MiniLineChart({super.key, required this.dataPoints});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 120,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(
                dataPoints.length,
                (i) => FlSpot(i.toDouble(), dataPoints[i]),
              ),
              isCurved: true,
              color: Colors.greenAccent,
              belowBarData: BarAreaData(
                show: true,
                color: Color.fromRGBO(0, 255, 133, 0.3),
              ),
              dotData: const FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
