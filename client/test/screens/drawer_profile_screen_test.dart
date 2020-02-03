import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:parking_app/providers/user.dart';
import 'package:parking_app/providers/users.dart';
import 'package:parking_app/screens/drawer_profile_screen.dart';
import 'package:provider/provider.dart';

class MockUsers extends Mock implements Users {}

main() {
  testWidgets('updating all user data', (WidgetTester tester) async {
    final mockUsers = MockUsers();

    var u = User(
        id: 123,
        name: "Peter",
        surname: "Parker",
        email: "p.p@gmail.com",
        phoneNo: 5555555555,
        password: "test123");

    //when(mockUsers.fetchAndSetUsers())
    //    .thenAnswer((_) => Future.value([u]));

    await tester.pumpWidget(ChangeNotifierProvider<Users>.value(
      child: MaterialApp(
        home: ProfileScreen(),
      ),
      value: mockUsers,
    ),);

    await tester.pumpAndSettle();

    final newValues = ["Jan", "Kowalski",  "1234567890", "j.k@gmail.com", "test321", "test321"];
    for (var i = 0; i < newValues.length; i++) {
      await tester.enterText(find.byType(TextField).at(i), newValues[i]);
    }

    await tester.tap(find.byType(FlatButton));

    await tester.pumpAndSettle();

    var capturedArgs = verify(mockUsers.updateUser(captureAny,captureAny)).captured;
    User user = capturedArgs[1];
    expect(capturedArgs[0], 123);
    expect(user.id, 123);
    expect(user.name, "Jan");
    expect(user.surname, "Kowalski");
    expect(user.phoneNo, 1234567890);
    expect(user.email, "j.k@gmail.com");
    expect(user.password, "test321");
  });

  testWidgets('submitting with no modifications', (WidgetTester tester) async {
    final mockUsers = MockUsers();

    var u = User(
        id: 123,
        name: "Peter",
        surname: "Parker",
        email: "p.p@gmail.com",
        phoneNo: 5555555555,
        password: "test123");

    //when(mockUsers.fetchAndSetUsers())
    //    .thenAnswer((_) => Future.value([u]));

    await tester.pumpWidget(ChangeNotifierProvider<Users>.value(
      child: MaterialApp(
        home: ProfileScreen(),
      ),
      value: mockUsers,
    ),);

    await tester.pumpAndSettle();

    await tester.tap(find.byType(FlatButton));

    await tester.pumpAndSettle();

    var capturedArgs = verify(mockUsers.updateUser(captureAny,captureAny)).captured;
    User user = capturedArgs[1];
    expect(capturedArgs[0], 123);
    expect(user.id, 123);
    expect(user.name, "Peter");
    expect(user.surname, "Parker");
    expect(user.phoneNo, 5555555555);
    expect(user.email, "p.p@gmail.com");
    expect(user.password, "test123");
  });
}
