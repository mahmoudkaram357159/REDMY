import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/modules/basics/counter/cubit/cuibtCounter.dart';

import 'cubit/cuibtStates.dart';

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => CounterCubit(),
      child: BlocConsumer<CounterCubit, CounterStates>(
        listener: (context, state) {
          if (state is CounterPlusState)
            print('CounterPlusState ${state.counter}');
          if (state is CounterMinusState)
            print('CounterPlusState ${state.counter}');
        },
        builder: (context, state) => Scaffold(
          appBar: AppBar(
            title: Text("Counter"),
          ),
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      CounterCubit.get(context).minus();
                    },
                    child: Text("MINUS")),
                Text(
                  "${CounterCubit.get(context).counter}",
                  style: TextStyle(
                    fontSize: 60.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      CounterCubit.get(context).plus();
                    },
                    child: Text("PLUS")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
