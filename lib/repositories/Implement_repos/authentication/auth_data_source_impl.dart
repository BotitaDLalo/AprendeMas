import 'package:aprende_mas/config/network/dio_client.dart';
import 'package:aprende_mas/config/services/services.dart';
import 'package:aprende_mas/models/models.dart';
import 'package:aprende_mas/repositories/Interface_repos/authentication/auth_data_source.dart';
import 'package:aprende_mas/config/utils/packages.dart';

class AuthDataSourceImpl implements AuthDataSource {
  @override
  Future<AuthUser> login(String email, String password) async {
    const uri = "/Login/InicioSesionUsuario";
    try {
      final res =
          await dio.post(uri, data: {'correo': email, 'clave': password});

      final user = AuthUserMapper.userJsonToEntity(res.data);

      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) throw WrongCredentials();
      if (e.type == DioExceptionType.connectionTimeout)throw ConnectionTimeout();
      throw CustomError(message: 'Ocurrio un error', errorCode: 1);
    } catch (e) {
      throw CustomError(message: 'Ocurrio un error', errorCode: 1);
    }
  }

  @override
  Future<User> signin(
      String name, String email, String password, String role) async {
    const uri = "/Login/RegistroUsuario";
    try {
      final res = await dio.post(uri, data: {
        'NombreUsuario': name,
        'ApellidoPaterno':'prueba',
        'ApellidoMaterno':'prueba', 
        'Nombre': 'prueba',
        'Correo': email,
        'Clave': password,
        'TipoUsuario': role
      });
      final user = UserMapper.userSiginJsonToEntity(res.data);

      return user;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) throw ConnectionTimeout();
      throw CustomError(message: 'Ocurrio un error', errorCode: 1);
    } catch (e) {
      throw CustomError(message: 'Ocurrio un error', errorCode: 1);
    }
  }

  @override
  Future<AuthUser> checkAuthStatus(String token) async {
    try {
      final res = await dio
          .get('/Login/VerificarToken', queryParameters: {"token": token});

      final user = AuthUserMapper.userJsonToEntity(res.data);

      return user;
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        throw CustomError(message: 'Token incorrecto', errorCode: 1);
      }
      throw CustomError(message: 'Ocurrio un error', errorCode: 1);
    } catch (e) {
      throw CustomError(message: 'Ocurrio un error', errorCode: 1);
    }
  }

  @override
  Future<bool> resetPasswordRequest(String email) async {
    const uri = "/CorreoRestablecerPassword/EnvioCodigo";
    try {
      final resetPasswordStatus = await dio.post(uri,data: {"Destinatario":email});

      if(resetPasswordStatus.statusCode==200){
        return true;
      }
      return false;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout) throw ConnectionTimeout();
      throw CustomError(message: 'Ocurrio un error', errorCode: 1);
    } catch (e) {
      print(e);
      throw CustomError(message: 'Ocurrio un error', errorCode: 1);
    }
  }

  @override
  Future<AuthUser> loginGoogle() async {
    const uri = "/GoogleSignin/IniciarSesionGoogle";
    try {
      final googleSigninApi = GoogleSigninApiImpl();
      final googleUserData = await googleSigninApi.handlerGoogleSignIn();
      final idToken = googleUserData?.idToken;

      final res = await dio.post(uri, data: {"IdToken": idToken, "Role": "Alumno"});

      final user = AuthUserMapper.userJsonToEntity(res.data);

      return user;
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout)throw ConnectionTimeout();
      throw CustomError(message: 'Ocurrio un error', errorCode: 1);
    } catch (e) {
      // throw CustomError(message: 'Ocurrio un error', errorCode: 1);
      print(e);
      throw Exception(e);
    }
  }
}
