class ApiEndpoints {
  // Auth
  /// user : 09966698861 - Password "Aa123456"
  static const authController = '/auth';
  static const String login = '$authController/login';
  static const String register = '$authController/register';
  static const String getUser = '$authController/me';

  // ads
  static const adsController = '/ads';
  static const String jobseekerAds = '$adsController/jobseeker';
  static const String employerAds = '$adsController/employer';
  static const String sellerAds = '$adsController/seller';

  // user-view
  static const userViewController = '/user-views';
  static const weeklyStats =
      '$userViewController?period=weekly&adType=JobSeekerAd';
}
