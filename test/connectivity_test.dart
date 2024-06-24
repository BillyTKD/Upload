import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:task_manager_app/firebase_options.dart';

void main() {
  const MethodChannel channel = MethodChannel('plugins.flutter.io/firebase_core');

  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    // Simula a resposta do canal de plataforma
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      if (methodCall.method == 'Firebase#initializeCore') {
        return {
          'name': '[DEFAULT]',
          'options': {
            'apiKey': 'AIzaSyCynsQ_POEmClIONvCCwCu3vOqDMMVC3ig',
            'appId': '1:649595255234:android:aec13a47db125352ef3e5b',
            'messagingSenderId': '649595255234',
            'projectId': 'projeto-pos-b0f2b',
            'storageBucket': 'projeto-pos-b0f2b.appspot.com',
          },
        };
      }
      return null;
    });
    await Firebase.initializeApp(options: firebaseOptions);
  });

  test('Verificar Conectividade com o Firebase', () async {
    FirebaseApp app = Firebase.app();
    expect(app, isNotNull);
    expect(app.name, equals('[DEFAULT]'));
  });
}
