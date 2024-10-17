import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class ScanQRPage extends StatefulWidget {
  @override
  _ScanQRPageState createState() => _ScanQRPageState();
}

class _ScanQRPageState extends State<ScanQRPage> {
  bool _isScanning = false;

  Future<void> _handleScanResult(String? scanResult) async {
    if (scanResult != null) {
      setState(() {
        _isScanning = false;
      });

      if (await canLaunch(scanResult)) {
        await launch(scanResult);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch $scanResult')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scan QR Code'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: _isScanning
                ? ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: MobileScanner(
                onDetect: (capture) {
                  final List<Barcode> barcodes = capture.barcodes;
                  for (final barcode in barcodes) {
                    _handleScanResult(barcode.rawValue);
                    break;
                  }
                },
              ),
            )
                : Center(
              child: Text('Tap the button to start scanning'),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(24),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  _isScanning = !_isScanning;
                });
              },
              child: Text(_isScanning ? 'Stop Scanning' : 'Start Scanning'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}