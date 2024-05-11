// import 'package:esc_pos_utils/esc_pos_utils.dart';
// import 'package:esc_pos_bluetooth/esc_pos_bluetooth.dart';

// Future<void> printReceipt(List<String> lines) async {
//   // Concatenate all lines to form the receipt content
//   String receiptContent = lines.join('\n');

//   // Get the Bluetooth device
//   final BluetoothDevice printer = await (PrinterBluetoothDiscovery().discoverDevices()).first;

//   // Create a Bluetooth connection
//   final connection = BluetoothConnection(printer);

//   try {
//     // Open the Bluetooth connection
//     await connection.open();

//     // Create a printer instance
//     final printer = ReceiptPrinter(connection);

//     // Print the receipt content
//     printer.text(receiptContent);
//     printer.cut();

//     // Close the connection
//     await connection.close();
    
//     print('Receipt printed successfully');
//   } catch (e) {
//     print('Failed to print the receipt: $e');
//   }
// }
