import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/models/shop_app/login_model.dart';
import 'package:mk/modules/shop_app/register/cubit/states.dart';
import 'package:mk/shared/network/end_points.dart';
import 'package:mk/shared/network/remote/dio_helper.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates> {
  ShopRegisterCubit() : super(ShopRegisterInitialState());
  static ShopRegisterCubit get(context) => BlocProvider.of(context);
  ShopLoginModel? loginModel;
  var suffix = Icons.remove_red_eye;
  bool isPassword = true;
  bool isSubmit = true;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    isPassword
        ? suffix = Icons.remove_red_eye
        : suffix = Icons.visibility_off_rounded;
    emit(ShopRegisterChangePasswordVisibilityState());
  }

  void userLogin(
      {required String email,
      required String password,
      required String phone,
      required String name}) {
    emit(ShopRegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'email': email,
        'password': password,
        'phone': phone,
        'name': name
      },
    )?.then((value) {
      print(value?.data);
      loginModel = ShopLoginModel.fromJson(value?.data);
      emit(ShopRegisterSuccessState(loginModel!));
    }).catchError((error) {
      print(error.toString());
      emit(ShopRegisterErrorState(error.toString()));
    });
  }
}
