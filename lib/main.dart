import 'package:code_scanner/page/create_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:code_scanner/page/scan_page.dart';
import 'package:code_scanner/widget/image_widget.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Code Scanner ';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
        ),
        home: MainPage(title: title),
        routes: {
          'QrScan': (context) => ScanPage(type: true),
          'QrCreate': (context) => CreatePage(type: true),
          'BarCodeScan': (context) => ScanPage(type: false),
          'BarCodeCreate': (context) => CreatePage(type: false)
        },
      );
}

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    @required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            widget.title,
            textAlign: TextAlign.center,
          ),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ImageWidget(
                image: 'qrcode1',
                type: true,
              ),
              ImageWidget(
                image: 'barcode1',
                type: false,
              ),
            ],
          ),
        ),
      );
}
