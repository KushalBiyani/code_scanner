import 'package:code_scanner/main.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  final bool type;
  CreatePage({@required this.type});
  @override
  _CreatePageState createState() => _CreatePageState(type: type);
}

class _CreatePageState extends State<CreatePage> {
  _CreatePageState({@required this.type});
  final bool type;
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(MyApp.title),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(16),
                  child: BarcodeWidget(
                    barcode: type ? Barcode.qrCode() : Barcode.code128(),
                    data: controller.text ?? 'Code Scanner',
                    width: 200,
                    height: 200,
                    drawText: !type,
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  children: [
                    Expanded(child: buildTextField(context)),
                    const SizedBox(width: 12),
                    FloatingActionButton(
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Icon(Icons.done, size: 30),
                      onPressed: () => setState(() {}),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildTextField(BuildContext context) => TextField(
        controller: controller,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
        decoration: InputDecoration(
          hintText: 'Enter the data',
          hintStyle: TextStyle(color: Colors.grey),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      );
}
