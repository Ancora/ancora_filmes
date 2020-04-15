import 'package:ancorafilmes/login/login_api.dart';
import 'package:ancorafilmes/utils/simple_bloc.dart';

class LoginBloc extends SimpleBloc {
  login(LoginInput input) async {
    progress.setProgress(true);

    try {
      return await LoginApi.login(input);
    } finally {
      progress.setProgress(false);
    }
  }
}
