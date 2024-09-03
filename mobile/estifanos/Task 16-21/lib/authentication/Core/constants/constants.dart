class newUrls{
  static const String baseUrl = 'https://g5-flutter-learning-path-be.onrender.com/api/v2/auth';
  static String loginUserUrl(String email, String password) => '$baseUrl/login';
  static String signupUserUrl(String name, String email, String password) => '$baseUrl/register';
  static String logoutUserUrl() => baseUrl;
}