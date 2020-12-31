import 'package:fcharts/fcharts.dart';
import 'package:flutter/material.dart';

class SimpleLineChart extends StatelessWidget {
  // X value -> Y value
  static const myData = [
    ["A", "✔"],
    ["B", "❓"],
    ["C", "✖"],
    ["D", "❓"],
    ["E", "✖"],
    ["F", "✖"],
    ["G", "✔"],
  ];

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 100,
      child: new LineChart(
        lines: [
          new Line<List<String>, String, String>(
              data: myData,
              xFn: (datum) => datum[0],
              yFn: (datum) => datum[1],
              marker: MarkerOptions(
                shape: MyMarker(),
                paint: new PaintOptions.fill(color: Colors.blue),
              )),
        ],
        chartPadding: new EdgeInsets.fromLTRB(30.0, 10.0, 10.0, 30.0),
      ),
    );
  }
}

class MyMarker extends MarkerShape {
  double pi = 3.1415926535897932;

  @override
  void draw(CanvasArea area, List<PaintOptions> paints) {
    for (final paint in paints) area.drawArc(area.full, 0.0, 2 * pi, paint);
  }
}

/// Our sparkline data.
const data = [0.0, -0.2, -0.9, -0.5, 0.0, 0.5, 0.6, 0.9, 0.8, 1.2, 0.5, 0.0];

class SparklineChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new AspectRatio(
      aspectRatio: 4.0,
      child: new LineChart(
        lines: [
          new Sparkline(
            data: data,
            stroke: new PaintOptions.stroke(
              color: Colors.blue,
              strokeWidth: 2.0,
            ),
            marker: new MarkerOptions(
              paint: new PaintOptions.fill(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
