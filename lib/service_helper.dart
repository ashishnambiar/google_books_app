import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart';

Future<Response?> serviceHelper({
  required String url,
  // required ReqType reqType,
}) async {
  Client client = Client();
  Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
  };
  try {
    // throw Error();
    Response res = await client.get(Uri.parse(url), headers: headers);
    return res;
  } catch (err, st) {
    log('Error Service for ${url} : ', error: err);
    log('StackTrace Service for ${url} : ', error: err);
  }
}

enum ReqType { get, post }
