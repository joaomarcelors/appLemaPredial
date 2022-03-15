import 'package:flutter/material.dart';
import 'package:lema_predial/providers/auth.dart';
import 'package:provider/provider.dart';

class AuthWidget extends StatefulWidget {
  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  GlobalKey<FormState> _form = GlobalKey();

  bool _isLoading = false;

  final _passwordController = TextEditingController();

  final Map<String, String> _authData = {
    'user': '',
    'password': '',
  };

  Future<void> _submit() async {
    if (!_form.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    _form.currentState!.save(); //chama o save de cada textFormField

    Auth auth = Provider.of(context, listen: false);

    await auth.login(_authData['user']!, _authData['password']!);

    setState(() {
      _isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _form,
        child: Column(
          children: [
            TextFormField(
              cursorColor: Theme.of(context).primaryColor,
              decoration: InputDecoration(
                label: Text(
                  'Usuário',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                // enabledBorder: UnderlineInputBorder(
                //   borderSide: BorderSide(
                //     color: Colors.black,
                //   )
                // ),
              ),
              validator: (value) {
                if (value!.isEmpty || value.length < 5) {
                  return 'Informe um usuário válido!';
                }
                return null;
              },
              onSaved: (value) => _authData['user'] = value!.trim(),
            ),
            TextFormField(
              cursorColor: Theme.of(context).primaryColor,
              controller: _passwordController,
              decoration: InputDecoration(
                label: Text(
                  'Senha',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 18,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              obscureText: true,
              validator: (value) {
                if (value!.isEmpty || value.length < 5) {
                  return 'Informe uma senha válida!';
                }
                return null;
              },
              onSaved: (value) => _authData['password'] = value!,
            ),
            SizedBox(height: 20),
            if (_isLoading)
              CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              )
            else
              ElevatedButton(
                onPressed: _submit,
                child: Text('Entrar'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Theme.of(context).primaryColor),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 10,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
