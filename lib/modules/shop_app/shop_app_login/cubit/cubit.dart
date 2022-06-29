import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/models/shop_app/login_model.dart';
import 'package:mk/modules/shop_app/shop_app_login/cubit/states.dart';
import 'package:mk/shared/network/end_points.dart';
import 'package:mk/shared/network/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());
  static ShopLoginCubit get(context) => BlocProvider.of(context);
  ShopLoginModel? loginModel;
  var suffix = Icons.remove_red_eye;
  bool isPassword = true;
  bool isSubmit = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    isPassword
        ? suffix = Icons.remove_red_eye
        : suffix = Icons.visibility_off_rounded;
    emit(ShopLoginChangePasswordVisibilityState());
  }

  void userLogin({required String email, required String password}) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {'email': email, 'password': password},
    )?.then((value) {
      print(value?.data);
      loginModel = ShopLoginModel.fromJson(value?.data);
      emit(ShopLoginSuccessState(loginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopLoginErrorState(error.toString()));
    });
  }
}
