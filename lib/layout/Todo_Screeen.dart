import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mk/modules/todo_app/newtasks/new_task.dart';
import 'package:mk/shared/components/components.dart';
import 'package:mk/shared/cuibt/cuibt.dart';
import 'package:mk/shared/cuibt/states.dart';

import '../shared/components/constants.dart';
import '../shared/cuibt/cuibt.dart';

class HomeLayout extends StatelessWidget {
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..createDatabase(), //..   (.) وليكني اني حفظته في متغير وعملت
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          if (state is AppInsertDatabaseState) Navigator.pop(context);
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scaffoldKey,
            appBar: AppBar(
              title: Text(
                cubit.titles[cubit.currentIndex],
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            body: cubit.screens[cubit.currentIndex],
            floatingActionButton: floatingAction(
              x: cubit.screens[cubit.currentIndex] is NewTask1,
              S: FloatingActionButton(
                backgroundColor: k, splashColor: r,
                //foregroundColor: r,
                onPressed: () {
                  if (cubit.isBottomSheetShown) {
                    if (formKey.currentState!.validate()) {
                      cubit.insertToDatabase(
                          title: titleController.text,
                          date: dateController.text,
                          time: timeController.text);
                    }
                  } else {
                    scaffoldKey.currentState
                        ?.showBottomSheet(
                          (context) => Container(
                            padding: const EdgeInsets.all(10.0),
                            color: Colors.white10,
                            child: Form(
                              key: formKey,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  defaultFormFiled(
                                      onTap: () {},
                                      controller: titleController,
                                      type: TextInputType.text,
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'title must not be empty';
                                        }
                                      },
                                      label: "Task Title",
                                      prefix: Icons.title),
                                  const SizedBox(
                                    height: 9.0,
                                  ),
                                  defaultFormFiled(
                                      onTap: () {
                                        showTimePicker(
                                                context: context,
                                                initialTime: TimeOfDay.now())
                                            .then((value) {
                                          timeController.text =
                                              value!.format(context).toString();
                                          print(timeController.text);
                                        });
                                      },
                                      controller: timeController,
                                      type: TextInputType.datetime,
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'time must not be empty';
                                        }
                                      },
                                      label: "Task time",
                                      prefix: Icons.timer_outlined),
                                  const SizedBox(
                                    height: 9.0,
                                  ),
                                  defaultFormFiled(
                                      onTap: () {
                                        showDatePicker(
                                                context: context,
                                                initialDate: DateTime.now(),
                                                firstDate: DateTime.now(),
                                                lastDate: DateTime.parse(
                                                    '2050-12-29'))
                                            .then((value) {
                                          dateController.text =
                                              DateFormat.yMMMd().format(value!);
                                          print(dateController.text);
                                        });
                                      },
                                      controller: dateController,
                                      type: TextInputType.datetime,
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return 'date must not be empty';
                                        }
                                      },
                                      label: "Task date",
                                      prefix: Icons.calendar_today)
                                ],
                              ),
                            ),
                          ),
                        )
                        .closed
                        .then((value) {
                      cubit.changeBottomSheet(isShow: false, icon: Icons.edit);
                      titleController.text = '';
                      timeController.text = '';
                      dateController.text = '';
                    });
                    cubit.changeBottomSheet(isShow: true, icon: Icons.add);
                  }
                },
                child: Icon(
                  cubit.fabIcon,
                ),
              ),
            ),
            bottomNavigationBar: BottomNavigationBar(
              elevation: 300.0,
              landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeIndex(index);
                print(cubit.screens[cubit.currentIndex]);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list,
                  ),
                  label: 'new tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.check_circle,
                  ),
                  label: 'done tasks',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.archive_outlined,
                  ),
                  label: 'archived  tasks',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
