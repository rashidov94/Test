import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:texlama/entity/report.dart';

class RemoteSource {
  static Future<Report> getReport() async {
    try {
      Response response = await Dio()
          .get("https://run.mocky.io/v3/c1a6371f-898a-4cf1-b991-7c69854ef5ab");
      return Report.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
    }
  }
}
