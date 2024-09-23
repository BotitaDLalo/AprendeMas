import 'package:aprende_mas/config/network/dio_client.dart';
import 'package:aprende_mas/models/authentication/user_sigin_mapper.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/repositories/Interface_repos/auth_data_source.dart';
import 'package:dio/dio.dart';
import 'package:aprende_mas/models/authentication/auth_errors.dart';
import '../../models/authentication/user_mapper.dart';

class AuthDataSourceImpl implements AuthDataSource {
  @override
  Future<User> checkAuthStatus(String token) async {
    try {
      final res = await dio.get('/AppMovilLogin/VerificarToken', queryParameters: {"token":token});

      final user = UserMapper.userJsonToEntity(res.data);

      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401){
        throw CustomError(message: 'Token incorrecto', errorCode: 1);
      }
      print('Error');
      print(e);
      throw CustomError(message: 'Ocurrio un error', errorCode: 1);
    } catch (e) {
      print('Error');
      print(e);
      throw CustomError(message: 'Ocurrio un error', errorCode: 1);
    }
  }

  @override
  Future<User> login(String email, String password) async {
    const uri = "/AppMovilLogin/IniciarSesion";
    try {
      final res = await dio.post(uri, data: {'correo': email, 'clave': password});

      final user = UserMapper.userJsonToEntity(res.data);

      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) throw WrongCredentials();
      if (e.type == DioExceptionType.connectionTimeout) throw ConnectionTimeout();
      print('Error');
      print(e);
      throw CustomError(message: 'Ocurrio un error', errorCode: 1);
    } catch (e) {
      print('Error');
      print(e);
      throw CustomError(message: 'Ocurrio un error', errorCode: 1);
    }
  }

  @override
  Future<UserSigin> sigin(
      String name, String email, String password, String role) async {
    const uri = "/AppMovilLogin/Registrarse";
    try {
      final res = await dio.post(uri, data: {
        'NombreUsuario': name,
        'Correo': email,
        'Clave': password,
        'TipoUsuarioId': role
      });

      final user = UserSiginMapper.userSiginJsonToEntity(res.data);

      return user;
    } on DioException catch (e) {
      print(e);
      if (e.type == DioExceptionType.connectionTimeout)
        throw ConnectionTimeout();
      throw CustomError(message: 'Ocurrio un error', errorCode: 1);
    } catch (e) {
      print('Error' + ", " + e.toString());
      throw CustomError(message: 'Ocurrio un error', errorCode: 1);
    }
  }
}
