import 'dart:developer';

import 'package:google_books_app/Controller/api_abstract_controller.dart';
import 'package:google_books_app/Model/book_response.dart';
import 'package:google_books_app/constants.dart';
import 'package:google_books_app/service_helper.dart';

class BookDetailController extends APIController {
  static Map<String, BookDetail> bookCache = {};
  BookDetail? bookDetail;

  fetchBook(String id) async {
    bookDetail = null;
    notLoaded();
    String url = Url.bookDetail + id;
    try {
      if (bookCache.containsKey(id) && bookCache[id] != null) {
        bookDetail = bookCache[id];
      } else {
        var res = await serviceHelper(url: url);
        bookDetail = bookDetailFromJson(res!.body);
        if (bookDetail != null) bookCache.addAll({id: bookDetail!});
      }
    } catch (e, st) {
      log('BookSearchController Error:', error: e);
      log('BookSearchController StackTrace:', error: st);
    } finally {
      hasLoaded();
    }
  }
}
