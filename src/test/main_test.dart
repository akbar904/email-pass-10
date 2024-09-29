
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_app/main.dart'; // Ensure the correct import path

void main() {
	group('Main App Initialization', () {
		testWidgets('App starts with LoginScreen', (WidgetTester tester) async {
			await tester.pumpWidget(MainApp());

			// Check if the LoginScreen is present by looking for a widget unique to LoginScreen
			expect(find.text('Login'), findsOneWidget);
		});
	});

	group('AuthCubit', () {
		// Mock dependencies if necessary
		// Note: Typically you'd mock dependencies here, but since we're limited to lib/main.dart, we'll assume AuthCubit is simple.

		blocTest<AuthCubit, AuthState>(
			'emits [AuthInitial, Authenticated] when login is successful',
			build: () => AuthCubit(),
			act: (cubit) => cubit.login('test@example.com', 'password'),
			expect: () => [AuthInitial(), Authenticated()],
		);

		blocTest<AuthCubit, AuthState>(
			'emits [AuthInitial, Unauthenticated] when logout is called',
			build: () => AuthCubit(),
			act: (cubit) => cubit.logout(),
			expect: () => [AuthInitial(), Unauthenticated()],
		);
	});
}
