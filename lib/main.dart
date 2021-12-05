import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(home: new DemoApp()));
}

class DemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: new Signature());
  }
}

class Signature extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new SignatureState();
  }
}

class SignatureState extends State<Signature> {
  List<Offset> _points = <Offset>[];

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        onPanUpdate: (DragUpdateDetails detail) {
          setState(() {
            RenderBox referenceBox = context.findRenderObject() as RenderBox;
            Offset localPosition =
                referenceBox.globalToLocal(detail.globalPosition);
            _points = new List.from(_points)..add(localPosition);
          });
        },
        onPanEnd: (DragEndDetails details) {
          // _points.add(null);
        },
        child: new CustomPaint(
          painter: new SignaturePainter(_points),
        ));
  }
}

class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);

  final List<Offset> points;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = new Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      canvas.drawLine(points[i], points[i + 1], paint);
    }
  }

  @override
  bool shouldRepaint(covariant SignaturePainter other) {
    return other.points != points;
  }
}

// class FadeApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//         title: "Fade app",
//         theme: new ThemeData(primaryColor: Colors.blue),
//         home: new FadeAppPage(title: "Fade demo"));
//   }
// }
//
// class FadeAppPage extends StatefulWidget {
//   FadeAppPage({Key? key, required this.title}) : super(key: key);
//   final String title;
//
//   @override
//   State<StatefulWidget> createState() {
//     return new _FadeAppPage();
//   }
// }
//
// class _FadeAppPage extends State<FadeAppPage> with TickerProviderStateMixin {
//   late AnimationController controller;
//   late CurvedAnimation curve;
//
//   @override
//   void initState() {
//     super.initState();
//     controller = new AnimationController(
//         duration: const Duration(milliseconds: 2000), vsync: this);
//     curve = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(title: new Text(widget.title)),
//       body: new Center(
//           child: new Container(
//               child: new FadeTransition(
//                   opacity: curve, child: new FlutterLogo(size: 100.0)))),
//       floatingActionButton: new FloatingActionButton(
//           tooltip: "Fade",
//           child: new Icon(Icons.brush),
//           onPressed: () {
//             controller.forward();
//           }),
//     );
//   }
// }

// class SampleApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//       title: "Sample App",
//       theme: new ThemeData(primaryColor: Colors.blue),
//       home: new SampleAppPage(),
//     );
//   }
// }
//
// class SampleAppPage extends StatefulWidget {
//   SampleAppPage({Key? key}) : super(key: key);
//
//   @override
//   _SampleAppPageState createState() {
//     return new _SampleAppPageState();
//   }
// }
//
// class _SampleAppPageState extends State<SampleAppPage> {
//   bool toggle = true;
//
//   void _toggle() {
//     setState(() {
//       toggle = !toggle;
//     });
//   }
//
//   _getToggleChild() {
//     if (toggle) {
//       return new Text("Toggle One");
//     } else {
//       return new MaterialButton(
//           color: Colors.blue, onPressed: () {}, child: new Text("Toggle Two"));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(title: new Text("Sample app")),
//       body: new Center(child: _getToggleChild()),
//       floatingActionButton: new FloatingActionButton(
//         onPressed: _toggle,
//         tooltip: 'toggle',
//         child: new Icon(Icons.update),
//       ),
//     );
//   }
// }

// class _XmlAppPageState extends State {
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(title: new Text("Xml app")),
//       body: new Center(
//         child: new MaterialButton(
//           color: Colors.blue,
//           textColor: Colors.white,
//           onPressed: () {},
//           child: new Text("hello xml"),
//           padding: new EdgeInsets.only(left: 10.0, right: 10.0),
//         ),
//       ),
//     );
//   }
// }

//
// class _SampleAppPageState extends State<SampleAppPage> {
//   String textToShow = "I like show flutter";
//   int updateNum = 0;
//
//   void _updateText() {
//     setState(() {
//       updateNum += 1;
//       textToShow = "Flutter is fuck Awesome $updateNum";
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Scaffold(
//       appBar: new AppBar(title: new Text("Sample app")),
//       body: new Center(child: new Text(textToShow)),
//       floatingActionButton: new FloatingActionButton(
//         onPressed: _updateText,
//         tooltip: 'updateText',
//         child: new Icon(Icons.update),
//       ),
//     );
//   }
// }
