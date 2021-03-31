import 'package:flutter/material.dart';
import 'package:flutter_testing/model/login.dart';
import 'package:provider/provider.dart';

class FirstPage extends StatelessWidget {
  static String routeName = '/first';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First Page'),
      ),
      body: Consumer<LoginProvider>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                key: Key('username'),
                controller: value.usernameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Username',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                key: Key('password'),
                controller: value.passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
              RaisedButton(
                key: Key('submit'),
                onPressed: () async {
                  final result = await value.check();
                  if (result)
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('login success'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  else
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('login fail'),
                        duration: Duration(seconds: 1),
                      ),
                    );
                    await Future.delayed(const Duration(milliseconds: 2000));
                    Navigator.pushNamed(context, '/');
                },
                child: Text('Login'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
