// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BookModel {
  String? title;
  String? subtitle;
  String? isbn13;
  String? price;
  String? image;
  String? url;
  BookModel({
    this.title,
    this.subtitle,
    this.isbn13,
    this.price,
    this.image,
    this.url,
  });

  BookModel copyWith({
    String? title,
    String? subtitle,
    String? isbn13,
    String? price,
    String? image,
    String? url,
  }) {
    return BookModel(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      isbn13: isbn13 ?? this.isbn13,
      price: price ?? this.price,
      image: image ?? this.image,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'subtitle': subtitle,
      'isbn13': isbn13,
      'price': price,
      'image': image,
      'url': url,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      title: map['title'] != null ? map['title'] as String : null,
      subtitle: map['subtitle'] != null ? map['subtitle'] as String : null,
      isbn13: map['isbn13'] != null ? map['isbn13'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      url: map['url'] != null ? map['url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BookModel.fromJson(String source) =>
      BookModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BookModel(title: $title, subtitle: $subtitle, isbn13: $isbn13, price: $price, image: $image, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookModel &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.isbn13 == isbn13 &&
        other.price == price &&
        other.image == image &&
        other.url == url;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        subtitle.hashCode ^
        isbn13.hashCode ^
        price.hashCode ^
        image.hashCode ^
        url.hashCode;
  }
}
