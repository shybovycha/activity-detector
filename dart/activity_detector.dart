import 'dart:html';
import 'dart:math';

/*window.accel = {
        firstTimestamp: new Date().getTime(),
        lastTimestamp: new Date().getTime(),
        data: [],
        tag: 0
    };

    window.ondevicemotion = function(event) {
        var aX = event.accelerationIncludingGravity.x;
        var aY = event.accelerationIncludingGravity.y;
        var aZ = event.accelerationIncludingGravity.z;
        var now = new Date().getTime();
        var ft = window.accel.firstTimestamp;
        var lt = window.accel.lastTimestamp;
        var t = now - ft;
        var dt = now - lt;

        var a = { x: aX, y: aY, z: aZ, t: t, dt: dt };

        //document.querySelector('#log').innerHTML += JSON.stringify(a) + '<br />';

        window.accel.data.push(a);
        window.accel.lastTimestamp = now;
    }

    window.onload = function() {
        var logElt = document.querySelector('#log');

        logElt.addEventListener('click', function() {
            window.accel.tag += 1;

            var request = new XMLHttpRequest();
            request.open('POST', 'http://192.168.2.237/save_accel_data.php', true);
            request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');

            request.onreadystatechange = function() {
                logElt.innerHTML = '>>>' + request.responseText;
                window.accel.data = [];
                window.accel.firstTimestamp = new Date().getTime();

                if (request.readyState != 4 || request.status != 200) {
                    logElt.innerHTML = '!!! ERROR' + '<br/>';
                    return;
                }
            }

            request.send('accelData=' + encodeURIComponent(JSON.stringify(window.accel)));

            // logElt.innerHTML += 'Sent report #' + window.accel.tag + '<br/>';
        });
    }*/

class AccelerometerData {
  List timestamps;
  List xs;
  List ys;
  List zs;

  AccelerometerData(this.timestamps, this.xs, this.ys, this.zs);
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
  
  List<TimestampedAxisData> findTimestampedHeaps(List timestamps, List axisData) {
    return null;
  }
}

class AxesData {
  AxisDataParams xParams, yParams, zParams;
  
  AxesData(this.xParams, this.yParams, this.zParams);
}

class ActivityPattern extends AxesData {
  String name;

  ActivityPattern(this.name, AxisDataParams xps, AxisDataParams yps, AxisDataParams zps) : super(xps, yps, zps);

  bool matches(AxisDataParams xps, AxisDataParams yps, AxisDataParams zps) {
    throw new Exception("Not implemented");
  }
}

class RunningPattern extends ActivityPattern {
  RunningPattern() : super("running", new AxisDataParams(2.8987123028039465,34.238), new AxisDataParams(3.1576390575661892,39.217), new AxisDataParams(1.9150973507819982,38.891999999999996));

  bool matches(AxisDataParams xps, AxisDataParams yps, AxisDataParams zps) {
    if (
      xps.frequency >= 2.5 &&
      xps.amplitude >= 34 &&
      yps.frequency >= 3.0 &&
      yps.amplitude >= 35 &&
      zps.frequency >= 1.9 &&
      zps.amplitude >= 35
       )
      return true;

    return false;
  }
}

class JumpingPattern extends ActivityPattern {
  JumpingPattern() : super("jumping", new AxisDataParams(2.9940119760479043,24.728), new AxisDataParams(1.7003188097768331,39.217), new AxisDataParams(2.5,38.729));

  bool matches(AxisDataParams xps, AxisDataParams yps, AxisDataParams zps) {
    if (
      xps.frequency >= 2.5 &&
      xps.amplitude >= 25 &&
      yps.frequency >= 1.5 &&
      yps.amplitude >= 35 &&
      zps.frequency >= 2.5 &&
      zps.amplitude >= 35
       )
      return true;

    return false;
  }
}

class WalkingPattern extends ActivityPattern {
  WalkingPattern() : super("walking", new AxisDataParams(2.0268748592448014,16.147000000000002), new AxisDataParams(6.831476025788822,12.669), new AxisDataParams(5.457664119756744,12.812999999999999));

  bool matches(AxisDataParams xps, AxisDataParams yps, AxisDataParams zps) {
    if (
      xps.frequency >= 2.0 &&
      xps.amplitude >= 15 &&
      yps.frequency >= 5.0 &&
      yps.amplitude >= 10 &&
      zps.frequency >= 5.0 &&
      zps.amplitude >= 10
       )
      return true;

    return false;
  }
}

class StayingPattern extends ActivityPattern {
  StayingPattern() : super("staying", new AxisDataParams(9.973310858266611,13.972), new AxisDataParams(8.962488129154796,12.813), new AxisDataParams(8.504398826979472,14.432));

  bool matches(AxisDataParams xps, AxisDataParams yps, AxisDataParams zps) {
    if (
      xps.frequency >= 8.0 &&
      xps.amplitude >= 10 &&
      yps.frequency >= 8.0 &&
      yps.amplitude >= 10 &&
      zps.frequency >= 8.0 &&
      zps.amplitude >= 10
       )
      return true;

    return false;
  }
}

class SittingPattern extends ActivityPattern {
  SittingPattern() : super("sitting", new AxisDataParams(7.07, 17.69), new AxisDataParams(7.83, 11.17), new AxisDataParams(2.9, 28.72));

  bool matches(AxisDataParams xps, AxisDataParams yps, AxisDataParams zps) {
    if (
      xps.frequency >= 5.0 &&
      xps.amplitude >= 10 &&
      yps.frequency >= 5.0 &&
      yps.amplitude >= 10 &&
      zps.frequency >= 2.0 &&
      zps.amplitude >= 10
       )
      return true;

    return false;
  }
}

class UnknownPattern extends ActivityPattern {
  UnknownPattern() : super("unknown", new AxisDataParams(0.0, 0.0), new AxisDataParams(0.0, 0.0), new AxisDataParams(0.0, 0.0));

  bool matches(AxisDataParams xps, AxisDataParams yps, AxisDataParams zps) {
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

  String match(AccelerometerData data) {
    for (ActivityPattern pattern in activityPatterns) {
      // if (pattern.matches())
    }
    
    throw new Exception("Something really bad happened and I can not match any of existing patterns with the given one");
  }
}

class UI {
  UI() {}
}

void main() {
  window.onDeviceMotion.listen(UI.detectAndDisplay);
  querySelector('#moo').innerHtml = 'Hello, world!';
}
