
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:com.example.simple_app/lib/cubits/auth_state.dart';

void main() {
	group('AuthState', () {
		test('supports value equality', () {
			expect(AuthInitial(), equals(AuthInitial()));
			expect(Authenticated(), equals(Authenticated()));
			expect(Unauthenticated(), equals(Unauthenticated()));
		});

		test('props are correct for AuthInitial', () {
			expect(AuthInitial().props, []);
		});

		test('props are correct for Authenticated', () {
			expect(Authenticated().props, []);
		});

		test('props are correct for Unauthenticated', () {
			expect(Unauthenticated().props, []);
		});
	});
}
