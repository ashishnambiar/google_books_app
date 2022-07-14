import 'package:flutter/material.dart';
import 'package:google_books_app/Controller/book_search_controller.dart';
import 'package:google_books_app/Widgets/book_tile.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final TextEditingController _searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bookSearch =
        Provider.of<BookSearchController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('BOOKS APP'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            // backgroundColor: Colors.transparent,
            toolbarHeight: 70,
            flexibleSpace: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      onSubmitted: (val) {
                        bookSearch.fetchQuery(_searchText.text);
                      },
                      controller: _searchText,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: Colors.black54,
                        filled: true,
                      ),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        FocusScope.of(context).unfocus();
                        bookSearch.fetchQuery(_searchText.text);
                      },
                      icon: const Icon(Icons.search)),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(10),
            sliver: Consumer<BookSearchController>(
                builder: (context, controller, child) {
              if (!controller.isloaded) {
                return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator()));
              }
              if (controller.items.isEmpty) {
                return const SliverFillRemaining(
                    child: Center(
                  child: Text('Search for a book',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                ));
              }
              return SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    var volInfo = controller.items[index].volInfo!;
                    return BookTile(
                        id: controller.items[index].id!,
                        title: '${volInfo.title}',
                        image: volInfo.images == null
                            ? ''
                            : '${volInfo.images!.main}');
                  },
                  childCount: controller.items.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .8,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
