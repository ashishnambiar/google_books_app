import 'package:flutter/material.dart';
import 'package:google_books_app/Controller/book_detail_controller.dart';
import 'package:provider/provider.dart';
import 'package:flutter_html/flutter_html.dart';

class BookDetailPage extends StatelessWidget {
  BookDetailPage({required this.id, required this.title, Key? key})
      : super(key: key);
  String id;
  String title;
  bool inited = false;

  @override
  Widget build(BuildContext context) {
    final bookDetail =
        Provider.of<BookDetailController>(context, listen: false);
    if (!inited) {
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
        bookDetail.fetchBook(id);
        inited = true;
      });
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body:
          Consumer<BookDetailController>(builder: (context, controller, child) {
        if (!controller.isloaded)
          return Center(child: CircularProgressIndicator());
        if (controller.bookDetail == null)
          return Center(child: Text("There was an error"));
        var volInfo = controller.bookDetail!.volumeInfo!;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                AspectRatio(
                    aspectRatio: 1.5,
                    child: Image.network(
                      '${volInfo.imageLinks!.thumbnail}',
                      fit: BoxFit.contain,
                    )),
                SizedBox(height: 25),
                Text(
                  '${volInfo.title}',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text('- ${volInfo.authors!.join(', ')}'),
                if (volInfo.description != null)
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Html(
                      data: '${volInfo.description}',
                    ),
                  ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
