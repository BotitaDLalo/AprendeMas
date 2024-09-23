import 'package:aprende_mas/config/environment/environmen.dart';
import 'package:dio/dio.dart';

final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));