import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/shared/components/components.dart';
import 'package:mk/shared/cuibt/cuibt.dart';
import 'package:mk/shared/cuibt/states.dart';

class NewTask1 extends StatelessWidget {
  const NewTask1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (
        context,
        state,
      ) {},
      builder: (
        context,
        state,
      ) {
        var tasks = AppCubit.get(context).newTasks;
        return tasksBuilder(tasks: tasks);
      },
    );
  }
}
