class ApiEndpoints {
  static const String baseUrl = 'https://barchasb-main-server.ir/api';

  // Auth
  /// user : 09966698861 - Password "Aa123456"
  static const authController = '$baseUrl/auth';
  static const String login = '$authController/login';
  static const String register = '$authController/register';

  // ads
  static const adsController = '$baseUrl/ads';
  static const String jobseeker = '$adsController/jobseeker';
  static const String employer = '$adsController/employer';
  static const String seller = '$adsController/seller';
}
