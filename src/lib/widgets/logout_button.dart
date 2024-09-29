
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/auth_cubit.dart';

class LogoutButton extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		final authCubit = context.read<AuthCubit>();

		return ElevatedButton(
			onPressed: () {
				authCubit.logout();
			},
			child: Text('Logout'),
		);
	}
}
