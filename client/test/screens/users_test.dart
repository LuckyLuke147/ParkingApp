import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:parking_app/providers/user.dart';
import 'package:parking_app/providers/users.dart';
import 'package:parking_app/screens/drawer_profile_screen.dart';

class MockClient extends Mock implements http.Client {}

main() {
  test('updating users', () async {
    final client = MockClient();
    final users = Users();
    var notifyCalled = false;
    users.addListener(() {
      notifyCalled = true;
    });
    await users.updateUserInternal(
        client,
        123,
        User(
            id: 123,
            name: "Peter",
            surname: "Parker",
            email: "a.b@gmail.com",
            phoneNo: 5555555555,
            password: "test123"));

    expect(notifyCalled, true);
    verify(client.put(argThat(equals('http://192.168.0.178:8080/users/123')),
        body: argThat(equals(
            "{\"name\":\"Peter\",\"surname\":\"Parker\",\"e_mail\":\"a.b@gmail.com\",\"phone_number\":5555555555,\"password\":\"test123\"}"),
            named: "body")));
  });
}
