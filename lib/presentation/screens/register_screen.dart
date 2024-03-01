import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_forms/infrastructure/inputs/Username.dart';
import 'package:flutter_forms/presentation/blocs/register/register_cubit.dart';
import 'package:flutter_forms/presentation/widgets/inputs/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New user'),
      ),
      body: BlocProvider(
        create: (context) => RegisterCubit(),
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatelessWidget {
  const _RegisterView();

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(
          children: [FlutterLogo(size: 120), _RegisterForm()],
        ),
      ),
    ));
  }
}

class _RegisterForm extends StatelessWidget {
  const _RegisterForm();

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final registerCubit = context.watch<RegisterCubit>(); //re render build func

    final username = registerCubit.state.username;
    final email = registerCubit.state.email;
    final password = registerCubit.state.password;

    return Form(
        child: Column(
      children: [
        CustomTextFormField(
          label: 'Nombre de usuario',
          onChanged: (value) {
            registerCubit.usernameChanged(value);
          },
          errorMessage: username.errorMessage,
        ),
        const SizedBox(height: 10),
        CustomTextFormField(
            label: 'Correo electrónico',
            onChanged: registerCubit.emailChanged,
            errorMessage: email.errorMessage,
          ),
        const SizedBox(height: 10),
        CustomTextFormField(
          label: 'Contraseña ${password.value}',
          obscureText: true,
          onChanged: registerCubit.passwordChanged,
          errorMessage: password.errorMessage,
        ),
        const SizedBox(height: 20),
        FilledButton.tonalIcon(
          onPressed: () {
            // final isValid = _formKey.currentState!.validate();
            // if (!isValid) return;

            // print('$username, $email, $password');
            registerCubit.onSubmit();
          },
          icon: const Icon(Icons.save),
          label: const Text('Crear usuario'),
        ),
      ],
    ));
  }
}
