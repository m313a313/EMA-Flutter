import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ema/cubit/auht_cubit/auth_states.dart';
import 'package:ema/helper/API.dart';
import 'package:ema/shared/constants.dart';
import 'package:ema/shared/network/local_network.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(initialState());
  Dio dio = Dio();

  void register(
      {required String email,
      required String password,
      required String cpassword,
      required String name}) async {
    try {
      emit(LoadingState());
      Response response = await API().Post(
          url: '$baseUrl' '/api/register',
          body: {
            'email': email,
            'password': password,
            'name': name,
          },
          token: null);

      if (response.data['status'] == true) {
        print(response.data['data']['id']);
        print('ffff${response.data['access-token']}');
        await LocalNetwork.insertUserIdToCash(
            key: 'id', id: response.data['data']['id']);
        await LocalNetwork.insertUserTokenToCash(
            key: 'token', token: response.data['access-token']);
        emit(LoginSuscessState());
      }

      if (response.data['status'] == false) {
        emit(LoginFailedState(msg: response.data['error']));
      }
    } on DioException catch (e) {
      emit(
          LoginFailedState(msg: e.response?.data['message'] ?? 'unkown error'));
    }
  }
}
