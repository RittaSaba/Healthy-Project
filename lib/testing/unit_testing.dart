import 'package:temp_task2/app/SignUp/sign_up_controller.dart';
import 'package:flutter_test/flutter_test.dart';



void main() {
  test('check if username text form field validating  works', () {
    final SignUpController obj = SignUpController();

    String? result1 = obj.usernameValidator('');
    expect(result1,'username field is required');
  });
}
