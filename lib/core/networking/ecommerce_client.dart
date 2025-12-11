import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';

import '../constants/api_constants.dart';

part 'ecommerce_client.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class EcommerceClient {
  factory EcommerceClient(Dio dio, {String? baseUrl}) = _EcommerceClient;

}

