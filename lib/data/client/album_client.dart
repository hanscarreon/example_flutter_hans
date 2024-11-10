

import 'package:dio/dio.dart';

class PhototApiClient {
  final Dio dio;

  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  PhototApiClient(this.dio);

}
