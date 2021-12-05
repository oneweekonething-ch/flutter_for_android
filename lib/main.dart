import 'package:flutter/material.dart';

void main() {
  runApp(new SampleApp());
}

class SampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Sample App",
      theme: new ThemeData(primaryColor: Colors.blue),
      home: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key? key}) : super(key: key);

  @override
  _SampleAppPageState createState() {
    return new _SampleAppPageState();
  }
}

class _SampleAppPageState extends State<SampleAppPage> {
  bool toggle = true;

  void _toggle() {
    setState(() {
      toggle = !toggle;
    });
  }

  _getToggleChild() {
    if (toggle) {
      return new Text("Toggle One");
    } else {
      return new MaterialButton(
          onPressed: () {}, child: new Text("Toggle Two"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text("Sample app")),
      body: new Center(child: _getToggleChild()),
      floatingActionButton: new FloatingActionButton(
        onPressed: _toggle,
        tooltip: 'toggle',
        child: new Icon(Icons.update),
      ),
    );
  }
}

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
