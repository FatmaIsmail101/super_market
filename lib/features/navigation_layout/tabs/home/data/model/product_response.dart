import 'package:json_annotation/json_annotation.dart';
import 'package:route_e_commerce_v2/features/navigation_layout/tabs/home/data/model/product_model.dart';

part 'product_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ProductsResponse {
  int? results;
  Metadata? metadata;
  @JsonKey(name: "data")
  List<ProductModel>? products;

  ProductsResponse({this.results, this.metadata, this.products});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsResponseFromJson(json);
}
