
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_app/models/user.dart';

void main() {
	group('User Model Tests', () {
		test('User model should correctly initialize with given email and password', () {
			final user = User(email: 'test@example.com', password: 'password123');
			expect(user.email, 'test@example.com');
			expect(user.password, 'password123');
		});

		test('User model should correctly serialize to JSON', () {
			final user = User(email: 'test@example.com', password: 'password123');
			final json = user.toJson();
			expect(json['email'], 'test@example.com');
			expect(json['password'], 'password123');
		});

		test('User model should correctly deserialize from JSON', () {
			final json = {
				'email': 'test@example.com',
				'password': 'password123'
			};
			final user = User.fromJson(json);
			expect(user.email, 'test@example.com');
			expect(user.password, 'password123');
		});
	});
}
