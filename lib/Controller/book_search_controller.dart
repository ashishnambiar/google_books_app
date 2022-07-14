import 'dart:developer';

import 'package:google_books_app/Controller/api_abstract_controller.dart';
import 'package:google_books_app/Model/query_response.dart';
import 'package:google_books_app/constants.dart';
import 'package:google_books_app/service_helper.dart';

class BookSearchController extends APIController {
  List<Item> items = [];
  String currentlySearched = '';

  fetchQuery(String str) async {
    if (str == '') return;
    if (str == currentlySearched) return;

    notLoaded();
    String url = Url.booksQuery + str;
    try {
      var res = await serviceHelper(url: url);
      var details = QueryResponse.fromBody(res!.body);
      items = details.items!;
    } catch (e, st) {
      log('BookSearchController Error:', error: e);
      log('BookSearchController StackTrace:', error: st);
      items = [];
    } finally {
      hasLoaded();
    }
  }
}
