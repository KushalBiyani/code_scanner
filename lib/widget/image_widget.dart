import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ImageWidget extends StatelessWidget {
  final String image;
  final bool type;

  const ImageWidget({
    @required this.image,
    @required this.type,
    Key key,
  }) : super(key: key);

  @override
  // ignore: deprecated_member_use
  Widget build(BuildContext context) => RaisedButton(
        child: Container(
            child: Image.asset(
          'images/$image.jpg',
          fit: BoxFit.fill,
          height: 100,
          width: 100,
        )),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        textColor: Colors.white,
        onPressed: () => showPopup(context, type),
      );
}

void showPopup(context, type) {
  Alert(
    context: context,
    image: type
        ? Image.asset('images/qrcode1.jpg')
        : Image.asset('images/barcode1.jpg'),
    title: type ? 'QR Code' : 'Barcode',
    buttons: [
      DialogButton(
        child: Text(
          "Create",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        onPressed: () => Navigator.of(context)
            .popAndPushNamed(type ? 'QrCreate' : 'BarCodeCreate'),
        color: Color.fromRGBO(0, 179, 134, 1.0),
      ),
      DialogButton(
        child: Text(
          "Scan",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
        onPressed: () => Navigator.of(context)
            .popAndPushNamed(type ? 'QrScan' : 'BarCodeScan'),
        color: Colors.lightBlue,
      )
    ],
  ).show();
}
