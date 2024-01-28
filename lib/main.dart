import 'package:flutter/material.dart';
import 'package:flutter_exercise/screens/kakao_login.dart';
import 'package:flutter_exercise/screens/main_view_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(nativeAppKey: '7c918cbd7684d9f919c80c37beba204a');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final viewModel = MainViewModel(KakaoLogin());

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Hello flutter!'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${viewModel.isLogined}'),
              ElevatedButton(
                  onPressed: () async {
                    await viewModel.login();
                  },
                  child: const Text('Login')),
              ElevatedButton(
                  onPressed: () async {
                    await viewModel.logout();
                  },
                  child: const Text('Logout')),
              ElevatedButton(
                onPressed: () {
                  // 버튼이 클릭되었을 때 실행될 코드 작성
                  getLocation();
                },
                child: Text('Get Location'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
