import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/layout/shop_app/cubit/cubit.dart';
import 'package:mk/layout/shop_app/cubit/states.dart';
import 'package:mk/modules/shop_app/shop_app_login/shop_app_login.dart';
import 'package:mk/shared/components/components.dart';
import 'package:mk/shared/network/local/cache_helper.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({Key? key}) : super(key: key);
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var model = ShopCubit.get(context).userModel;
          nameController.text = model!.data!.name!;
          emailController.text = model.data!.email!;
          phoneController.text = model.data!.phone!;

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    if (state is ShopLoadingUpdateDataState)
                      LinearProgressIndicator(),
                    SizedBox(
                      height: 30,
                    ),
                    defaultFormFiled(
                        controller: nameController,
                        type: TextInputType.name,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'name must not be empty';
                          }
                        },
                        label: 'name',
                        prefix: Icons.person),
                    SizedBox(
                      height: 30,
                    ),
                    defaultFormFiled(
                        controller: emailController,
                        type: TextInputType.name,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'email must not be empty';
                          }
                        },
                        label: 'email',
                        prefix: Icons.email),
                    SizedBox(
                      height: 30,
                    ),
                    defaultFormFiled(
                        controller: phoneController,
                        type: TextInputType.phone,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'phone must not be empty';
                          }
                        },
                        label: 'phone',
                        prefix: Icons.phone),
                    SizedBox(
                      height: 30,
                    ),
                    defaultButton(
                        function: () {
                          if (formKey.currentState!.validate()) {
                            ShopCubit.get(context).updateData(
                                name: nameController.text,
                                phone: phoneController.text,
                                email: emailController.text);
                          }
                        },
                        text: 'update'),
                    SizedBox(
                      height: 20,
                    ),
                    defaultButton(
                        function: () {
                          CacheHelper.removeToken(key: 'token').then((value) {
                            if (value!) {
                              navigateEnd(context, ShopLoginScreen());
                            }
                          });
                        },
                        text: 'sign out'),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
