import 'package:ancorafilmes/login/login_api.dart';
import 'package:ancorafilmes/login/login_bloc.dart';
import 'package:ancorafilmes/utils/validators.dart';
import 'package:ancorafilmes/widgets/bg_login.dart';
import 'package:ancorafilmes/widgets/button.dart';
import 'package:ancorafilmes/widgets/link.dart';
import 'package:ancorafilmes/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _input = LoginInput();
  final _bloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          BgLogin(),
          _body(),
        ],
      ),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(32),
              child: Image.asset("assets/images/logoFilmes.png",
                  width: 140, height: 140),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: AppText(
                "Login",
                "Digite o seu login",
                validator: (text) {
                  return validateRequired(text, "Informe o login");
                },
                onSaved: (value) => this._input.login = value,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: AppText(
                "Senha",
                "Digite a sua senha",
                password: true,
                validator: (text) {
                  return validateRequired(text, "Informe a senha");
                },
                onSaved: (value) => this._input.senha = value,
              ),
            ),
            StreamBuilder<bool>(
              //stream: _bloc.progress.stream,
              initialData: false,
              builder: (context, snapshot) {
                return Container(
                  margin: EdgeInsets.only(top: 16),
                  child: AppButton(
                    "Login",
                    _onClickLogin,
                    showProgress: snapshot.data,
                  ),
                );
              },
            ),
            Container(
              margin: EdgeInsets.only(top: 16),
              child: GoogleSignInButton(
                text: 'Acesse com sua conta Google',
                onPressed: _onClickGoogle,
                borderRadius: 22,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 0),
              child: Center(
                child: AppLink(
                  "Cadastre-se",
                  _onClickCadastro,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onClickLogin() async {
    if (!_formKey.currentState.validate()) {
      return;
    }

    // Salva o form
    _formKey.currentState.save();

    print("Login: ${_input.login}, senha: ${_input.senha}");

    /* final response = await _bloc.login(_input);

    if (response.isOk()) {
      pushReplacement(context, HomePage());
    } else {
      alert(context, "Filmes", response.msg);
    } */
  }

  void _onClickCadastro() {}

  void _onClickGoogle() {}

  @override
  void dispose() {
    super.dispose();

    _bloc.dispose();
  }
}
