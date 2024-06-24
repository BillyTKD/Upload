import 'package:flutter_test/flutter_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:task_manager_app/firebase_options.dart';

void main() {
  setUpAll(() async {
    // Inicializa o Firebase para testes
    TestWidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: firebaseOptions);
  });

  test('Verificar Conectividade com o Firebase', () async {
    FirebaseApp app = Firebase.app();
    expect(app, isNotNull);
    expect(app.name, equals('[DEFAULT]'));
  });
}
