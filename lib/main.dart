import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Kalkulator Berat Badan',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Hot Reload App in IntelliJ). Notice that the counter
        // didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Kalkulator Berat Badan'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final tinggi_badan = TextEditingController();
  final berat_badan = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
        actions: <Widget>[
          new IconButton(icon: const Icon(Icons.save), onPressed: () {})
        ],
      ),
      body: new Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          // new Text("Kalimat"),
          new ListTile(
            leading: const Icon(Icons.person),
            title: new TextField(
              controller: tinggi_badan,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                hintText: "Tinggi Badan (CM)",
              ),
            ),
          ),
          new ListTile(
            leading: const Icon(Icons.slow_motion_video),
            title: new TextField(
              controller: berat_badan,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                hintText: "Berat Badan (KG)",
              ),
            ),
          ),
          new FlatButton(
            color: Colors.blue,
            child: Text(
              'Cek',
              style: TextStyle(color: Colors.white),
            ),
            // ignore: missing_return
            onPressed: () {
              var berat = int.parse(tinggi_badan.text) - 100;
              if (int.parse(berat_badan.text) > berat) {
                Alert(
                  context: context,
                  type: AlertType.warning,
                  title: "PERINGATAN OBESITAS",
                  desc: "Anda Mengalami Obesitas Silahkan Cek Diet yang Tepat",
                  buttons: [
                    DialogButton(
                      child: Text(
                        "PERIKSA",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      color: Color.fromRGBO(0, 179, 134, 1.0),
                    ),
                    DialogButton(
                      child: Text(
                        "BATAL",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(116, 116, 191, 1.0),
                        Color.fromRGBO(52, 138, 199, 1.0)
                      ]),
                    )
                  ],
                ).show();
              } else {
                Alert(
                  context: context,
                  type: AlertType.info,
                  title: "BERAT TUBUH ANDA NORMAL",
                  desc: "SELAMAT ANDA MEMILIKI TUBUH IDEAL",
                  buttons: [
                    DialogButton(
                      child: Text(
                        "PERIKSA",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      color: Color.fromRGBO(0, 179, 134, 1.0),
                    ),
                    DialogButton(
                      child: Text(
                        "BATAL",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      gradient: LinearGradient(colors: [
                        Color.fromRGBO(116, 116, 191, 1.0),
                        Color.fromRGBO(52, 138, 199, 1.0)
                      ]),
                    )
                  ],
                ).show();
              }
            },
          ),
        ],
      ),
    );
  }
}
