import 'package:flutter/material.dart';
import 'package:sample/core/cache/cache_helper.dart';
import 'package:sample/home.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Form(
        key: widget.formKey,
        child: Padding(
          padding: const EdgeInsetsDirectional.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'LOGIN',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 33.0),
              ),
              Text('Get your account to enjoy our products',
                  style: TextStyle(fontSize: 17.0)),
              SizedBox(
                height: 30.0,
              ),
              TextFormField(
                controller: widget.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    label: Text('Email'),
                    hintText: 'example123@gmail.com',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder()),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Email is required';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              TextFormField(
                controller: widget.passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                    label: Text('Password'),
                    hintText: 'Enter your password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            isPasswordVisible = !isPasswordVisible;
                          });
                        },
                        child: Icon(isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility)),
                    border: const OutlineInputBorder()),
                obscureText: isPasswordVisible,
                validator: (value) {
                  if (value!.length < 6) {
                    return 'Minimum required characters is 6';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30.0,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () {
                      if (widget.formKey.currentState!.validate()) {
                        CacheHelper.putSting('user_email', widget.emailController.text);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage(),),);
                      }
                    },
                    child: Text('Login')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
