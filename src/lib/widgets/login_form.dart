
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:com.example.simple_app/cubits/auth_cubit.dart';

class LoginForm extends StatefulWidget {
	@override
	_LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
	final TextEditingController _emailController = TextEditingController();
	final TextEditingController _passwordController = TextEditingController();

	@override
	Widget build(BuildContext context) {
		return Padding(
			padding: const EdgeInsets.all(16.0),
			child: Column(
				mainAxisAlignment: MainAxisAlignment.center,
				children: [
					TextField(
						key: Key('emailField'),
						controller: _emailController,
						decoration: InputDecoration(
							labelText: 'Email',
							border: OutlineInputBorder(),
						),
						keyboardType: TextInputType.emailAddress,
					),
					SizedBox(height: 16.0),
					TextField(
						key: Key('passwordField'),
						controller: _passwordController,
						decoration: InputDecoration(
							labelText: 'Password',
							border: OutlineInputBorder(),
						),
						obscureText: true,
					),
					SizedBox(height: 16.0),
					ElevatedButton(
						onPressed: () {
							final email = _emailController.text;
							final password = _passwordController.text;
							context.read<AuthCubit>().login(email, password);
						},
						child: Text('Login'),
					),
				],
			),
		);
	}
}
