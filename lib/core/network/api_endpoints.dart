class ApiEndpoints {
  // Auth
  /// user : 09966698861 - Password "Aa123456"
  static const authController = '/auth';
  static const String login = '$authController/login';
  static const String register = '$authController/register';
  static const String getUser = '$authController/me';

  // ads
  static const adsController = '/ads';
  static const String jobseeker = '$adsController/jobseeker';
  static const String employer = '$adsController/employer';
  static const String seller = '$adsController/seller';


}
