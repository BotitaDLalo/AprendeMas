import 'package:google_sign_in/google_sign_in.dart';
import '../../../models/models.dart';

abstract class GoogleSigninApi {
  Future<GoogleSignInAuthentication?> handlerGoogleSignIn();

  Future handlerGoogleLogout();

  Future<AuthUser> checkSignInStatus(String idToken);

  Future<bool> verifyExistingUser();
}
