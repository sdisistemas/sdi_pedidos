abstract class IAuthService {
  Future<dynamic> login(String email, String password);
  Future<dynamic> register(String name, String email, String password);
  Future<dynamic> getProfile();
  Future<dynamic> refreshToken(String token);
}
