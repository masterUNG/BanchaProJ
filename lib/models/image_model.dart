import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ImageModel {
  final String url;
  ImageModel({
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'url': url,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      url: (map['url'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ImageModel.fromJson(String source) => ImageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
