import 'dart:async';

import 'package:animated_splash/animated_splash.dart';
import 'package:connectivity/connectivity.dart';
import 'package:doceria_sao_jose/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_launcher_icons/android.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';



void main() {
  Function duringSplash = () {
    print('Something background process');
    int a = 123 + 23;
    print(a);

    if (a > 100)
      return 1;
    else
      return 2;
  };
  Map<int, Widget> op = {1: Home()};
  runApp(MaterialApp(
    title: kTitle,
    theme: theme(),
    home: AnimatedSplash(
      imagePath: 'assets/images/logodsj.png',
      home: Home(),
      duration: 200,
      customFunction: duringSplash,
      type: AnimatedSplashType.BackgroundProcess,
      outputAndHome: op,
    ),
  ));
}

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Acumin',
      appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          brightness: Brightness.light,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          textTheme: TextTheme(
              headline6: TextStyle(color: kPrimeryColor, fontSize: 15))),
      textTheme: TextTheme(
          bodyText1: TextStyle(color: kTextColor),
          bodyText2: TextStyle(color: kTextColor)),
      visualDensity: VisualDensity.adaptivePlatformDensity);
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  num position = 2;
  bool connected = false;
  WebViewController _webViewController;
  Map<String, dynamic> mapUrl = {"home": "https://www.doceriasaojose.com.br/"};
  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    //print("status conexao: "+_connectionStatus);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  @override
  Widget build(BuildContext context) {
    //print("resultado da conexao:"+_connectionStatus);

    return Scaffold(
        body: IndexedStack(
      index: position,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 30),
          child: WebView(
            initialUrl: mapUrl['home'],
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (controller) {
              _webViewController = controller;
            },
            onPageStarted: (value) {
              setState(() {
                if (connected) position = 1;
              });
            },
            onWebResourceError: (value) {
              setState(() {
                position = 2;
              });
            },
            onProgress: (value) {
              setState(() {
                if (connected) position = 1;
              });
            },
            onPageFinished: (value) {
              setState(() {
                if (connected) position = 0;
              });
            },
          ),
        ),
        Container(
          child: Center(child: CircularProgressIndicator()),
        ),
        Container(
          child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.error_outlined),
                Text(
                  "Não foi possivel conectar",
                  textAlign: TextAlign.center,
                ),
                Text("Verifique as conexões e tente novamente",
                    textAlign: TextAlign.center),
                Center(
                  child: FlatButton(
                      onPressed: () {
                        setState(() {
                          _webViewController.reload();
                        });
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      color: Colors.black12,
                      child: Text("Tentar novamente",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black45)
                      )
                  ),
                ),

              ],
            ),

        )
      ],
    ));
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        setState(() => connected = true);
        break;
      case ConnectivityResult.mobile:
        setState(() => connected = true);
        break;
      case ConnectivityResult.none:
        setState(() => connected = false);
        break;
      default:
        setState(() => _connectionStatus = 'Failed to get connectivity.');
        break;
    }
  }
}
