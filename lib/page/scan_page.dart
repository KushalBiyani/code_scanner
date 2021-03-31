import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../main.dart';

class ScanPage extends StatefulWidget {
  final bool type;
  ScanPage({@required this.type});
  @override
  State<StatefulWidget> createState() => _ScanPageState(type: type);
}

class _ScanPageState extends State<ScanPage> {
  _ScanPageState({@required this.type});
  final bool type;
  String code = 'Unknown';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(
            MyApp.title,
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Scan Result',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '$code',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 72),
              buildButton(context)
            ],
          ),
        ),
      );

  Future<void> scanCode() async {
    try {
      final code = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666',
        'Cancel',
        true,
        type ? ScanMode.QR : ScanMode.BARCODE,
      );

      if (!mounted) return;

      setState(() {
        this.code = code;
      });
    } on PlatformException {
      code = 'Failed to get platform version.';
    }
  }

  // ignore: deprecated_member_use
  Widget buildButton(BuildContext context) => RaisedButton(
        child: Text(
          type ? 'Start QR scan' : 'Start Barcode Scan',
          style: TextStyle(fontSize: 24),
        ),
        shape: StadiumBorder(),
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        textColor: Colors.white,
        onPressed: () => scanCode(),
      );
}
