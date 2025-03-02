import 'package:aprende_mas/config/environment/environment.dart';
import 'package:dio/dio.dart';

final dio = Dio(BaseOptions(
  baseUrl: Environment.apiUrl,
  connectTimeout: const Duration(seconds: 30),
));
