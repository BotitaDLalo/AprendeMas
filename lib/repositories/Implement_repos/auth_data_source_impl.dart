import 'package:aprende_mas/config/network/dio_client.dart';
import 'package:aprende_mas/models/authentication/user.dart';
import 'package:aprende_mas/repositories/Interface_repos/auth_data_source.dart';
import 'package:dio/dio.dart';
import 'package:aprende_mas/models/authentication/auth_errors.dart';
import '../../models/authentication/user_mapper.dart';

class AuthDataSourceImpl implements AuthDataSource{
  @override
  Future<User> checkAuthStatus(String token) {
    // TODO: implement checkAuthStatus
    throw UnimplementedError();
  }

  @override
    Future<User> login(String email, String password) async{
    try {
      final res = await dio.post('/auth/login', data: {
        'email':email,
        'password':password
      });

      final user = UserMapper.userJsonToEntity(res.data);

      return user; 
    } on DioException catch (e) {
      if(e.response?.statusCode==401) throw WrongCredentials();
      if(e.type == DioExceptionType.connectionTimeout) throw ConnectionTimeout();
      throw CustomError(message: 'Ocurrio un error', errorCode: 1);
    } catch(e){
      throw CustomError(message: 'Ocurrio un error', errorCode: 1);
    }
  }
  
}