
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mocktail/mocktail.dart';

import 'package:simple_app/widgets/logout_button.dart';
import 'package:simple_app/cubits/auth_cubit.dart';

// Mock class for AuthCubit
class MockAuthCubit extends Mock implements AuthCubit {}

void main() {
	group('LogoutButton Widget Tests', () {
		testWidgets('LogoutButton displays correctly', (WidgetTester tester) async {
			// Arrange
			final mockAuthCubit = MockAuthCubit();

			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: BlocProvider<AuthCubit>(
							create: (_) => mockAuthCubit,
							child: LogoutButton(),
						),
					),
				),
			);

			// Act
			await tester.pump();

			// Assert
			expect(find.byType(ElevatedButton), findsOneWidget);
			expect(find.text('Logout'), findsOneWidget);
		});

		testWidgets('LogoutButton triggers logout on press', (WidgetTester tester) async {
			// Arrange
			final mockAuthCubit = MockAuthCubit();

			await tester.pumpWidget(
				MaterialApp(
					home: Scaffold(
						body: BlocProvider<AuthCubit>(
							create: (_) => mockAuthCubit,
							child: LogoutButton(),
						),
					),
				),
			);

			// Act
			await tester.tap(find.byType(ElevatedButton));
			await tester.pump();

			// Assert
			verify(() => mockAuthCubit.logout()).called(1);
		});
	});
}
