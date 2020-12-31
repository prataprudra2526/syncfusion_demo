import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CartesianChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<SalesData> chartData = [
      SalesData(2010, 35),
      SalesData(2011, 28),
      SalesData(2012, 34),
      SalesData(2013, 32),
      SalesData(2014, 40)
    ];

    return Container(
        height: 200,
        child: SfCartesianChart(series: <ChartSeries>[
          // Renders line chart
          LineSeries<SalesData, double>(
            dataSource: chartData,
            xValueMapper: (SalesData sales, _) => sales.year,
            yValueMapper: (SalesData sales, _) => sales.sales,
            markerSettings: MarkerSettings(
                isVisible: true,
                shape: DataMarkerType.image,
                // Renders the image as marker
                image: AssetImage('images/google.png')
            ),
          )
        ]));
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final double year;
  final double sales;
}
