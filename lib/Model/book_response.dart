import 'dart:convert';

BookDetail bookDetailFromJson(String str) =>
    BookDetail.fromJson(json.decode(str));

class BookDetail {
  BookDetail({
    this.id,
    this.volumeInfo,
    this.saleInfo,
  });

  String? id;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;

  factory BookDetail.fromJson(Map<String, dynamic> json) => BookDetail(
        id: json["id"],
        volumeInfo: VolumeInfo.fromJson(json["volumeInfo"]),
        saleInfo: SaleInfo.fromJson(json["saleInfo"]),
      );
}

class SaleInfo {
  SaleInfo({
    this.country,
    this.saleability,
    this.isEbook,
  });

  String? country;
  String? saleability;
  bool? isEbook;

  factory SaleInfo.fromJson(Map<String, dynamic> json) => SaleInfo(
        country: json["country"],
        saleability: json["saleability"],
        isEbook: json["isEbook"],
      );
}

class VolumeInfo {
  VolumeInfo({
    this.title,
    this.authors,
    this.publisher,
    this.description,
    this.pageCount,
    this.categories,
    this.maturityRating,
    this.allowAnonLogging,
    this.contentVersion,
    this.imageLinks,
    this.language,
    this.previewLink,
    this.infoLink,
    this.canonicalVolumeLink,
  });

  String? title;
  List<String>? authors;
  String? publisher;
  String? description;
  int? pageCount;
  List<String>? categories;
  String? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  ImageLinks? imageLinks;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => VolumeInfo(
        title: json["title"],
        authors: List<String>.from(json["authors"].map((x) => x)),
        publisher: json["publisher"],
        description: json["description"],
        pageCount: json["pageCount"],
        categories: json["categories"] == null
            ? null
            : List<String>.from(json["categories"].map((x) => x)),
        maturityRating: json["maturityRating"],
        allowAnonLogging: json["allowAnonLogging"],
        contentVersion: json["contentVersion"],
        imageLinks: ImageLinks.fromJson(json["imageLinks"]),
        language: json["language"],
        previewLink: json["previewLink"],
        infoLink: json["infoLink"],
        canonicalVolumeLink: json["canonicalVolumeLink"],
      );
}

class Dimensions {
  Dimensions({
    this.height,
    this.width,
    this.thickness,
  });

  String? height;
  String? width;
  String? thickness;

  factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        height: json["height"],
        width: json["width"],
        thickness: json["thickness"],
      );
}

class ImageLinks {
  ImageLinks({
    this.smallThumbnail,
    this.thumbnail,
  });

  String? smallThumbnail;
  String? thumbnail;

  factory ImageLinks.fromJson(Map<String, dynamic> json) => ImageLinks(
        smallThumbnail: json["smallThumbnail"],
        thumbnail: json["thumbnail"],
      );
}
