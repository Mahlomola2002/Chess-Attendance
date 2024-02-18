// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';

import 'package:mobile_scanner/mobile_scanner.dart';

class QRViewExample extends StatefulWidget {
  @override
  _QRViewExampleState createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  @override
  Widget build(BuildContext context) {
    return MobileScanner(
      controller: MobileScannerController(
        detectionSpeed: DetectionSpeed.noDuplicates,
        returnImage: true,
      ),
      onDetect: (capture) {
        print(capture);
        // ignore: unused_local_variable
        final List<Barcode> barcodes = capture.barcodes;
        final Uint8List? image = capture.image;
        for (final barcode in barcodes) {
          print('Barcode found ${barcode.rawBytes}');
        }
      },
    );
  }
}
