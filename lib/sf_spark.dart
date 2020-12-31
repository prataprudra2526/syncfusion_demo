import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

import 'fake_network_stream.dart';

class SparkChart extends StatefulWidget {
  @override
  _SparkChartState createState() => _SparkChartState();
}

class _SparkChartState extends State<SparkChart> {
  @override
  void initState() {
    createLineChartFromStream();
    super.initState();
  }

  var _data = <double>[20, 19, 39, 25, 11, 28, 34, 28];

  void createLineChartFromStream() {
    FakeNetworkStream().getData().listen((event) {
      if (_data.length > 10) {
        _data.removeAt(0);
      }
      _data.add(event.toDouble());
      setState(() {
        _data = List.from(_data);
      });
      print('${_data.length}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
      child: SfSparkLineChart(
          trackball:
              SparkChartTrackball(activationMode: SparkChartActivationMode.tap),
          lastPointColor: Theme.of(context).primaryColor,
          //Enable marker
          marker: SparkChartMarker(
            displayMode: SparkChartMarkerDisplayMode.last,
            size: 7,
          ),
          //Enable data label
          // labelDisplayMode: SparkChartLabelDisplayMode.all,
          data: _data),
    );
  }
}
