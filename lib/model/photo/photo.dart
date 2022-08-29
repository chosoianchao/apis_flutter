import 'package:json_annotation/json_annotation.dart';

part 'photo.g.dart';

@JsonSerializable()
class Photo {
  @JsonKey(name: 'albumId')
  final int albumId;
  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'url')
  final String url;
  @JsonKey(name: 'thumbnailUrl')
  final String thumbnailUrl;

  Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  Photo.none(this.albumId, this.id, this.title, this.url, this.thumbnailUrl);
  // C1: Manual
  // factory Photo.fromJson(Map<String, dynamic> json) {
  //   return Photo(
  //     albumId: json['albumId'],
  //     id: json['id'],
  //     title: json['title'],
  //     url: json['url'],
  //     thumbnailUrl: json['thumbnailUrl'],
  //   );
  // }
  //
  // Map<String, dynamic> toJson() {
  //   return {
  //     'albumId': albumId,
  //     'id': id,
  //     'title': title,
  //     'url': url,
  //     'thumbnailUrl': thumbnailUrl,
  //   };
  // }

  // C2 : auto
  factory Photo.fromJson(Map<String, dynamic> json) => _$PhotoFromJson(json);

  Map<String, dynamic> toJson() => _$PhotoToJson(this);

  @override
  String toString() {
    return 'Photo{albumId: $albumId, id: $id, title: $title, url: $url, thumbnailUrl: $thumbnailUrl}';
  }
}

