import 'package:json_annotation/json_annotation.dart';

part 'metadata_dto.g.dart';

@JsonSerializable()
class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;

  Metadata({this.currentPage, this.numberOfPages, this.limit, this.nextPage});

  Map<String, dynamic> toJson() => _$MetadataToJson(this);

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);
}
