import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  String? serverRoute() {
    return (dotenv.env['ENV'] == "dev")
        ? dotenv.env['SERVER_URI_DEV']
        : dotenv.env['SERVER_URI_PROD'];
  }
}
