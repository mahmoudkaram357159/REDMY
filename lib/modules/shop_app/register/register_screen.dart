import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/layout/shop_app/shop_layout.dart';
import 'package:mk/models/shop_app/login_model.dart';
import 'package:mk/modules/shop_app/register/cubit/cubit.dart';
import 'package:mk/shared/components/components.dart';
import 'package:mk/shared/components/constants.dart';
import 'package:mk/shared/network/local/cache_helper.dart';

import 'cubit/states.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  ShopLoginModel? loginModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
        listener: (BuildContext context, state) {
          if (state is ShopRegisterSuccessState) {
            if (state.loginModel.status!) {
              showToast(
                  message: state.loginModel.message!,
                  state: ToastStates.SUCCESS);
              CacheHelper.saveData(
                      key: 'token', value: state.loginModel.data?.token)
                  .then((value) {
                token = state.loginModel.data!.token!;
                navigateEnd(context, ShopLayout());
              });
            } else {
              showToast(
                  message: state.loginModel.message!, state: ToastStates.ERROR);
            }
          }
        },
        builder: (BuildContext context, Object? state) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'REGISTER',
                            style: Theme.of(context)
                                .textTheme
                                .headline4
                                ?.copyWith(color: Colors.black),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Text(
                            'register now to browse our hot offers',
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                ?.copyWith(color: Colors.grey),
                          ),
                          SizedBox(
                            height: 25.0,
                          ),
                          defaultFormFiled(
                              controller: nameController,
                              type: TextInputType.name,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Your Name';
                                }
                              },
                              label: 'User Name',
                              prefix: Icons.person),
                          SizedBox(
                            height: 20.0,
                          ),
                          defaultFormFiled(
                            controller: emailController,
                            type: TextInputType.emailAddress,
                            validate: (String? value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Email';
                              }
                            },
                            label: 'Email Address',
                            prefix: Icons.email,
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          defaultFormFiled(
                              controller: passwordController,
                              type: TextInputType.visiblePassword,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Your Password Is Too Short';
                                }
                              },
                              label: 'Password',
                              isPassword:
                                  ShopRegisterCubit.get(context).isPassword,
                              prefix: Icons.lock,
                              suffixPressed: () {
                                ShopRegisterCubit.get(context)
                                    .changePasswordVisibility();
                              },
                              suffix: ShopRegisterCubit.get(context).suffix,
                              onSubmit: (value) {
                                if (formKey.currentState!.validate()) {
                                  ShopRegisterCubit.get(context).userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      phone: phoneController.text,
                                      name: nameController.text);
                                }
                              }),
                          SizedBox(
                            height: 20.0,
                          ),
                          defaultFormFiled(
                              controller: phoneController,
                              type: TextInputType.phone,
                              validate: (String? value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Your phone';
                                }
                              },
                              label: 'phone',
                              prefix: Icons.phone),
                          SizedBox(
                            height: 20.0,
                          ),
                          ConditionalBuilderRec(
                            fallback: (BuildContext context) =>
                                Center(child: CircularProgressIndicator()),
                            condition: state is! ShopRegisterLoadingState,
                            builder: (context) => defaultButton(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    ShopRegisterCubit.get(context).userLogin(
                                        email: emailController.text,
                                        password: passwordController.text,
                                        phone: phoneController.text,
                                        name: nameController.text);
                                  }
                                },
                                text: 'LOGIN'),
                          ),
                        ],
                      )),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
