import 'package:flutter_exercise/screens/social_login.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class KakaoLogin implements SocialLogin {
  @override
  Future<bool> login() async {
    try {
      bool isKakaoInstalled = await isKakaoTalkInstalled();
      if (isKakaoInstalled) {
        try {
          await UserApi.instance.loginWithKakaoTalk();
          print('로그인 성공');
          return true;
        } catch (e) {
          print('로그인 fail');
          return false;
        }
      } else {
        try {
          await UserApi.instance.loginWithKakaoAccount();
          print('로그인 성공');
          return true;
        } catch (e) {
          print('로그인 fail');
          return false;
        }
      }
    } catch (error) {
      print('로그인 fail');
      return false;
    }
  }

  @override
  Future<bool> logout() async {
    try {
      await UserApi.instance.unlink();
      print('로그아웃 성공');
      return true;
    } catch (error) {
      print('로그아웃 실패');
      return false;
    }
  }
}
