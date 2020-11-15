import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'form_store.dart';

class AuthPage extends StatefulWidget {

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  final store = FormStore();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Provider<FormStore>(
      create: (_) => store,
      child: Builder(
        builder: (context) {
          var store = Provider.of<FormStore>(context);
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Observer(
                builder: (_) {
                  return TextField(
                    onChanged: store.setUsername,
                    decoration: InputDecoration(
                      errorText: store.error.username,
                      labelText: 'Name',
                    ),
                  );
                },
              ),
              Observer(
                builder: (_) {
                  return TextField(
                    onChanged: store.setUsername,
                    decoration: InputDecoration(
                      errorText: store.error.email,
                      labelText: 'Email',
                    ),
                  );
                }
              ),
              Observer(
                builder: (_) {
                  return TextField(
                    onChanged: store.setPassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      errorText: store.error.password,
                      labelText: 'Password',
                    ),
                  );
                }
              ),
            ],
          );
        },
      ),
    );
  }
}
