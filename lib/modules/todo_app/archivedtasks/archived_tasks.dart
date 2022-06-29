import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/shared/components/components.dart';
import 'package:mk/shared/cuibt/cuibt.dart';
import 'package:mk/shared/cuibt/states.dart';

class ArchivedTask1 extends StatelessWidget {
  const ArchivedTask1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).archivedTasks;
        return tasksBuilder2(tasks: tasks);
      },
    );
  }
}
