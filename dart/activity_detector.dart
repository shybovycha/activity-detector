import 'dart:html';
import 'dart:math';
import 'dart:convert';

class AccelerometerData {
  List<int> timestamps;
  List<double> xs;
  List<double> ys;
  List<double> zs;

  AccelerometerData({this.timestamps, this.xs, this.ys, this.zs});

  AccelerometerData.blank() {
    this.timestamps = new List<int>();
    this.xs = new List<double>();
    this.ys = new List<double>();
    this.zs = new List<double>();
  }

  Map toObject() {
    var self = {
      "timestamps": this.timestamps,
      "xs": this.xs,
      "ys": this.ys,
      "zs": this.zs
    };

    return self;
  }
}

class TimestampedAxisData {
  double value;
  int timestamp;

  TimestampedAxisData(this.timestamp, this.value);
}

class AxisDataParams {
  double frequency;
  double amplitude;

  AxisDataParams(this.frequency, this.amplitude);

  AxisDataParams.fromAxisData(List<int> timestamps, List<double> axisData) {
    var timestampAxisData = findTimestampedHeaps(timestamps, axisData);
    this.frequency = findHeapFrequency(timestampAxisData);
    this.amplitude = findHeapAmplitude(axisData);
  }

  List<TimestampedAxisData> findTimestampedHeaps(List<int> timestamps, List<double> axisData) {
    double maxHeap = axisData.fold(0.0, (acc, elt) => (elt.abs() > acc) ? elt.abs() : acc);
    final double ampThreshold = 5.0;

    int len = min(timestamps.length, axisData.length);
    List<TimestampedAxisData> res = [];

    for (int i = 0; i < len; i++) {
      if ((axisData[i].abs() - maxHeap).abs() < ampThreshold) {
        res.add(new TimestampedAxisData(timestamps[i], axisData[i]));
      }
    }

    return res;
  }

  double findHeapFrequency(List<TimestampedAxisData> timestampedAxisData) {
    final double lowFreqThreshold = 100.0; // heap frequency threshold, msec
    final double highFreqThreshold = 1500.0;
    double timestampDiffsSum = 0.0;
    int timestampDiffsCnt = 0;

    for (int i = 1; i < timestampedAxisData.length; i++) {
      int diff = timestampedAxisData[i].timestamp - timestampedAxisData[i - 1].timestamp;

      if (diff >= lowFreqThreshold && diff <= highFreqThreshold) {
        timestampDiffsSum += diff;
        timestampDiffsCnt += 1;
      }
    }

    return 1000.0 / (timestampDiffsSum / timestampDiffsCnt);
  }

  double findHeapAmplitude(List<double> axisData) {
    double minHeap = axisData.fold(0.0, (acc, elt) => (elt.abs() < acc) ? elt.abs() : acc);
    double maxHeap = axisData.fold(0.0, (acc, elt) => (elt.abs() > acc) ? elt.abs() : acc);

    return maxHeap - minHeap;
  }

  Map toObject() {
    return {
      "frequency": this.frequency,
      "amplitude": this.amplitude
    };
  }
}

class AxesData {
  AxisDataParams xParams, yParams, zParams;

  AxesData(this.xParams, this.yParams, this.zParams);

  AxesData.fromAccelerometerData(AccelerometerData data) {
    this.xParams = new AxisDataParams.fromAxisData(data.timestamps, data.xs);
    this.yParams = new AxisDataParams.fromAxisData(data.timestamps, data.ys);
    this.zParams = new AxisDataParams.fromAxisData(data.timestamps, data.zs);
  }

  String toJson() {
    return JSON.encode(this);
  }

  Map toObject() {
    return {
      "xParams": this.xParams.toObject(),
      "yParams": this.yParams.toObject(),
      "zParams": this.zParams.toObject()
    };
  }
}

class ActivityPattern extends AxesData {
  String name;

  ActivityPattern(this.name, AxisDataParams xps, AxisDataParams yps, AxisDataParams zps) : super(xps, yps, zps);

  bool matches(AxesData params) {
    throw new Exception("Not implemented");
  }
}

class RunningPattern extends ActivityPattern {
  RunningPattern() : super("running", new AxisDataParams(2.8987123028039465,34.238), new AxisDataParams(3.1576390575661892,39.217), new AxisDataParams(1.9150973507819982,38.891999999999996));

  bool matches(AxesData params) {
    AxisDataParams xps = params.xParams, yps = params.yParams, zps = params.zParams;

    return (
      xps.frequency >= 2.5 &&
      xps.amplitude >= 34 &&
      yps.frequency >= 3.0 &&
      yps.amplitude >= 35 &&
      zps.frequency >= 1.9 &&
      zps.amplitude >= 35
       );
  }
}

class JumpingPattern extends ActivityPattern {
  JumpingPattern() : super("jumping", new AxisDataParams(2.9940119760479043,24.728), new AxisDataParams(1.7003188097768331,39.217), new AxisDataParams(2.5,38.729));

  bool matches(AxesData params) {
    AxisDataParams xps = params.xParams, yps = params.yParams, zps = params.zParams;

    return (
      xps.frequency >= 2.5 &&
      xps.amplitude >= 25 &&
      yps.frequency >= 1.5 &&
      yps.amplitude >= 35 &&
      zps.frequency >= 2.5 &&
      zps.amplitude >= 35
       );
  }
}

class WalkingPattern extends ActivityPattern {
  WalkingPattern() : super("walking", new AxisDataParams(2.0268748592448014,16.147000000000002), new AxisDataParams(6.831476025788822,12.669), new AxisDataParams(5.457664119756744,12.812999999999999));

  bool matches(AxesData params) {
    AxisDataParams xps = params.xParams, yps = params.yParams, zps = params.zParams;

    return (
      xps.frequency >= 2.0 &&
      xps.amplitude >= 15 &&
      yps.frequency >= 5.0 &&
      yps.amplitude >= 10 &&
      zps.frequency >= 5.0 &&
      zps.amplitude >= 10
       );
  }
}

class StayingPattern extends ActivityPattern {
  StayingPattern() : super("staying", new AxisDataParams(9.973310858266611,13.972), new AxisDataParams(8.962488129154796,12.813), new AxisDataParams(8.504398826979472,14.432));

  bool matches(AxesData params) {
    AxisDataParams xps = params.xParams, yps = params.yParams, zps = params.zParams;

    return (
      xps.frequency >= 8.0 &&
      xps.amplitude >= 10 &&
      yps.frequency >= 8.0 &&
      yps.amplitude >= 10 &&
      zps.frequency >= 8.0 &&
      zps.amplitude >= 10
       );
  }
}

class SittingPattern extends ActivityPattern {
  SittingPattern() : super("sitting", new AxisDataParams(7.07, 17.69), new AxisDataParams(7.83, 11.17), new AxisDataParams(2.9, 28.72));

  bool matches(AxesData params) {
    AxisDataParams xps = params.xParams, yps = params.yParams, zps = params.zParams;

    return (
      xps.frequency >= 5.0 &&
      xps.amplitude > 0 &&
      yps.frequency >= 5.0 &&
      yps.amplitude > 0 &&
      zps.frequency >= 2.0 &&
      zps.amplitude > 0
       );
  }
}

class UnknownPattern extends ActivityPattern {
  UnknownPattern() : super("unknown", new AxisDataParams(0.0, 0.0), new AxisDataParams(0.0, 0.0), new AxisDataParams(0.0, 0.0));

  bool matches(AxesData params) {
    return true;
  }
}

class ActivityMatcher {
  static final List activityPatterns = [
    new RunningPattern(),
    new JumpingPattern(),
    new WalkingPattern(),
    new StayingPattern(),
    new SittingPattern(),
    new UnknownPattern()
  ];

  ActivityMatcher() {}

  static ActivityPattern detect(AccelerometerData data) {
    AxesData params = new AxesData.fromAccelerometerData(data);

    return activityPatterns.firstWhere((ActivityPattern pattern) => pattern.matches(params));
  }

  static ActivityPattern match(AxesData data) {
    return activityPatterns.firstWhere((ActivityPattern pattern) => pattern.matches(data));
  }
}

class MotionTracker {
  AccelerometerData accelData;
  AxesData axesData;
  String label;

  MotionTracker() {
    this.accelData = new AccelerometerData.blank();
    this.axesData = null;
    this.label = 'unknown';
  }

  void track(AccelerometerData newPack) {
    this.accelData.timestamps.addAll(newPack.timestamps);
    this.accelData.xs.addAll(newPack.xs);
    this.accelData.ys.addAll(newPack.ys);
    this.accelData.zs.addAll(newPack.zs);

    this.axesData = new AxesData.fromAccelerometerData(this.accelData);
  }

  void flush(String label) {
    this.label = label;
    HttpRequest request = new HttpRequest();

    var url = "http://192.168.2.237/track_accel_data.php";
    request.open("post", url, async: true);
    request.onReadyStateChange.listen((_) {
      if (request.readyState == HttpRequest.DONE && request.status == 200) {
        window.console.log(request.responseText);
      }
    });
    request.send(this.toJson());

    this.accelData = new AccelerometerData.blank();
    this.axesData = null;
    this.label = 'unknown';
  }

  String toJson() {
    var self = {
      "label": this.label,
      "accelData": this.accelData.toObject(),
      "axesData": this.axesData.toObject()
    };

    window.console.log(self);
    window.console.log(JSON.encode(self));

    return JSON.encode(self);
  }
}

class MotionListener {
  HtmlElement activityNamePanel;
  HtmlElement infoPanel;

  AccelerometerData accelData;
  DateTime firstTimestamp;

  MotionTracker tracker;

  // store only last 5 seconds of data
  final int DATA_LIFE_TIME = 5 * 1000;

  MotionListener(this.activityNamePanel, this.infoPanel) {
    this.accelData = new AccelerometerData.blank();
    this.firstTimestamp = new DateTime.now();
    this.tracker = new MotionTracker();
  }

  void flush(Event e) {
    this.tracker.flush((e.target as ButtonElement).getAttribute('data-activity'));
  }

  void handle(DeviceMotionEvent e) {
    DateTime now = new DateTime.now();
    int ts = now.difference(this.firstTimestamp).inMilliseconds;
    double x = e.accelerationIncludingGravity.x,
           y = e.accelerationIncludingGravity.y,
           z = e.accelerationIncludingGravity.z;

    try {
      this.accelData.timestamps.add(ts);
      this.accelData.xs.add(x);
      this.accelData.ys.add(y);
      this.accelData.zs.add(z);

      AxesData params = new AxesData.fromAccelerometerData(this.accelData);
      ActivityPattern pattern = ActivityMatcher.match(params);
      // ActivityPattern pattern = ActivityMatcher.detect(this.accelData);

      if (ts > DATA_LIFE_TIME) {
        this.tracker.track(this.accelData);

        this.accelData = new AccelerometerData.blank();
        this.firstTimestamp = new DateTime.now();
      }

      this.activityNamePanel.innerHtml = pattern.name;

      if (this.infoPanel != null) {
        var xfreq = params.xParams.frequency, yfreq = params.yParams.frequency, zfreq = params.zParams.frequency;
        var xampl = params.xParams.amplitude, yampl = params.yParams.amplitude, zampl = params.zParams.amplitude;

        this.infoPanel.innerHtml = """
        <b>x</b>, freq: $xfreq; ampl: $xampl<br/>
        <b>y</b>, freq: $yfreq; ampl: $yampl<br/>
        <b>z</b>, freq: $zfreq; ampl: $zampl<br/>
        """;
      }
    } catch (e, trace) {
      window.alert("$e $trace");
    }
  }
}

void main() {
  if (true) {
    HtmlElement activityNamePanel = querySelector('#activity_name');

    MotionListener motionListener = new MotionListener(activityNamePanel, null);
    window.onDeviceMotion.listen(motionListener.handle);

    ElementList<ButtonElement> sendButtons = querySelectorAll('.btn.send[data-activity]');

    for (ButtonElement e in sendButtons) {
      e.onClick.listen(motionListener.flush);
    }
  } else {
    print(ActivityMatcher.activityPatterns.firstWhere((ActivityPattern pattern) => pattern.matches(new AxesData(new AxisDataParams(9.5, 1.3), new AxisDataParams(9.5, 0.3), new AxisDataParams(9.5, 9.8)))).name);
  }
}
