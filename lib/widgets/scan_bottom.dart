import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scan/models/scan_model.dart';
import 'package:qr_scan/provider/db_provider.dart';
import 'package:qr_scan/provider/scan_list_provider.dart';
import 'package:qr_scan/utils/utils.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(
        Icons.filter_center_focus,
      ),
      onPressed: () async {
        print('Botó polsat!');
        //String barcodeScanRes = "https://paucasesnovescifp.cat";
        //String barcodeScanRes = "geo:39.7260888,2.9113035";

        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
            '#3D88EF', 'Cancelar', false, ScanMode.QR);
        print(barcodeScanRes);
        final scanListProvider =
            Provider.of<ScanListProvider>(context, listen: false);
        scanListProvider.nouScan(barcodeScanRes);
        ScanModel nouScan = ScanModel(valor: barcodeScanRes);
        launchUrl(context, nouScan);
      },
    );
  }
}
