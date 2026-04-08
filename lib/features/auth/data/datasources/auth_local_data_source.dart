import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  Future<void> saveAccessToken(String token);
  Future<void> saveRefreshToken(String token);
  Future<void> saveRole(String role);

  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<String?> getRole();

  Future<void> updateAccessToken(String token);
  Future<void> updateRefreshToken(String token);

  Future<int> deleteAll();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({required this.sharedPreferences});

  static const String _accessTokenKey = 'accessToken';
  static const String _refreshTokenKey = 'refreshToken';
  static const String _roleKey = 'role';

  @override
  Future<void> saveAccessToken(String token) async {
    await sharedPreferences.setString(_accessTokenKey, token);
  }

  @override
  Future<void> saveRefreshToken(String token) async {
    await sharedPreferences.setString(_refreshTokenKey, token);
  }

  @override
  Future<void> saveRole(String role) async {
    await sharedPreferences.setString(_roleKey, role);
  }

  @override
  Future<String?> getAccessToken() async {
    return sharedPreferences.getString(_accessTokenKey);
  }

  @override
  Future<String?> getRefreshToken() async {
    return sharedPreferences.getString(_refreshTokenKey);
  }

  @override
  Future<String?> getRole() async {
    return sharedPreferences.getString(_roleKey);
  }

  @override
  Future<void> updateAccessToken(String token) async {
    await sharedPreferences.setString(_accessTokenKey, token);
  }

  @override
  Future<void> updateRefreshToken(String token) async {
    await sharedPreferences.setString(_refreshTokenKey, token);
  }

  @override
  Future<int> deleteAll() async {
    await sharedPreferences.remove(_accessTokenKey);
    await sharedPreferences.remove(_refreshTokenKey);
    await sharedPreferences.remove(_roleKey);
    return 0;
  }
}
