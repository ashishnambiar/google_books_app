import 'package:flutter/material.dart';
import 'package:google_books_app/Controller/book_detail_controller.dart';
import 'package:google_books_app/Screens/book_detail_page.dart';
import 'package:provider/provider.dart';

class BookTile extends StatelessWidget {
  BookTile({
    required this.title,
    required this.image,
    required this.id,
    Key? key,
  }) : super(key: key);
  String title;
  String image;
  String id;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BookDetailPage(
                id: id,
                title: title,
              ),
            ));
      },
      child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 5,
                )
              ]),
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    width: double.infinity,
                    color: Colors.white24,
                    padding: const EdgeInsets.all(8.0),
                    child: image == ''
                        ? Placeholder()
                        : Image.network(
                            image,
                            fit: BoxFit.contain,
                          ),
                  )),
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )),
            ],
          )),
    );
  }
}
