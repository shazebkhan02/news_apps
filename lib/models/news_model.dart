import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class NewsModel {
  static List<News> newsList = [];
}

class News {
  final String? title;
  final String? description;
  final String? imageUrl;
  final String? author;
  final String? date;

  News({
    this.title,
    this.description,
    this.imageUrl,
    this.author,
    this.date,
  });

  News copyWith({
    String? title,
    String? description,
    String? urlToImage,
    String? author,
    String? date,
  }) {
    return News(
      title: title ?? this.title,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      author: author ?? this.author,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'author': author,
      'date': date,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      title: map['title'] != null ? map['title'] as String : null,
      description:
      map['description'] != null ? map['description'] as String : null,
      imageUrl: map['imageUrl'] != null ? map['imageUrl'] as String : null,
      author: map['author'] != null ? map['author'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) =>
      News.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'News(title: $title, description: $description, imageUrl: $imageUrl, author: $author, date: $date)';
  }

  @override
  bool operator ==(covariant News other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.imageUrl == imageUrl &&
        other.author == author &&
        other.date == date;
  }

  @override
  int get hashCode {
    return title.hashCode ^
    description.hashCode ^
    imageUrl.hashCode ^
    author.hashCode ^
    date.hashCode;
  }
}
