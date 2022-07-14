import 'dart:convert';

class QueryResponse {
  QueryResponse({
    this.itemCount,
    this.items,
  });
  int? itemCount;
  List<Item>? items;

  factory QueryResponse.fromBody(String str) => fromJson(jsonDecode(str));
  static QueryResponse fromJson(Map<String, dynamic> json) => QueryResponse(
        items: json['items'] == null
            ? null
            : List<Item>.from(
                json['items'].map((e) => Item.fromJson(e)),
              ),
      );
}

class Item {
  Item({this.id, this.volInfo});

  String? id;
  VolumeInfo? volInfo;

  static Item fromJson(Map<String, dynamic> json) => Item(
        id: json['id'],
        volInfo: VolumeInfo.fromJson(json['volumeInfo']),
      );
}

class VolumeInfo {
  VolumeInfo(
      {this.title,
      this.authors,
      this.publisher,
      this.publishedDate,
      this.description,
      this.categories,
      this.images,
      this.pageCount,
      this.language});
  String? title;
  String? publisher;
  String? publishedDate;
  String? description;
  int? pageCount;
  List<String>? authors;
  List<String>? categories;
  ImageLinks? images;
  String? language;

  static VolumeInfo fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json['title'],
        description: json['description'],
        publisher: json['publisher'],
        publishedDate: json['publishedDate'],
        authors: json['authors'] == null
            ? null
            : List<String>.from(json['authors'].map((e) => e)),
        categories: json['categories'] == null
            ? null
            : List<String>.from(json['categories'].map((e) => e)),
        images: json['imageLinks'] == null
            ? null
            : ImageLinks.fromJson(json['imageLinks']),
        language: json['language'],
        pageCount: json['pageCount'],
      );
}

class ImageLinks {
  ImageLinks({this.small, this.main});
  String? small;
  String? main;

  static ImageLinks fromJson(Map<String, dynamic> json) =>
      ImageLinks(small: json['smallThumbnail'], main: json['smallThumbnail']);
}
