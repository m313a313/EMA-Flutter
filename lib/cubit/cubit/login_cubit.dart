import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ema/helper/API.dart';
import 'package:ema/shared/constants.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Dio dio = Dio();

  void login({
    required String email,
    required String password,
  }) async {
    try {
      emit(LoginLoading());
      Response response = await API().Post(
          url: '$baseUrl' '/api/login',
          body: {
            'email': email,
            'password': password,
          },
          token: null);

      if (response.data['status'] == true) {
        print('ggg');
        emit(LoginSuccess());
      } else if (response.data['status'] == false) {
         emit(LoginFalure(msg: response.data['error']));
        print('fff');
      }
    } on DioException catch (e) {
      emit(LoginFalure(msg: e.response?.data['message'] ?? 'unkown error'));
    }
  }
}
