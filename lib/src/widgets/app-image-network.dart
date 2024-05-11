import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class appImageNetwork extends StatelessWidget {
  final String endPoint;
  const appImageNetwork({Key? key, required this.endPoint})
      : super(key: key);
  static String baseUrl = dotenv.env['API_SERVER'] ?? 'http://noapi';
  @override
  Widget build(BuildContext context) {
    return Image.network('${baseUrl}/${endPoint}');
  }
}
