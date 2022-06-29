// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mk/shared/cuibt/states.dart';
// import 'package:sqflite/sqflite.dart';
//
// import '../../layout/home_layout.dart';
// import '../../modules/archivedtasks/archived_tasks_screen.dart';
// import '../../modules/donetasks/done_tasks_screen.dart';
// import '../../modules/newtasks/new_tasks_screen.dart';
// import '../components/constants.dart';
//
// class AppCubit extends Cubit<AppStates> {
//   AppCubit() : super(AppInitialState());
//
//   Database? database;
//   List<Map> newTasks = [];
//   List<Map> doneTasks = [];
//   List<Map> archivedTasks = [];
//   int currentIndex = 0;
//   bool isBottomSheetShown = false;
//   IconData fabIcon = Icons.add;
//   static AppCubit get(context) => BlocProvider.of(context);
//
//   void changeIndex(int index) {
//     currentIndex = index;
//     emit(AppChangeBottomNavBarState());
//   }
//   List<Widget> screen = [
//     NewTasks(),
//     DoneTasks(),
//     ArchivedTasks(),
//   ];
//   List<String> title = [
//     'NewTasks',
//     'DoneTasks',
//     'ArchivedTasks',
//   ];
//   void createDataBase() {
//     openDatabase('todo.db', version: 1, onCreate: (database, version) {
//       print('database created');
//       database
//           .execute(
//               'CREATE TABLE tasks(id INTEGER PRIMARY KEY ,title TEXT,date TEXT ,time TEXT,status TEXT)')
//           .then((value) {
//         print('table created');
//       });
//     }, onOpen: (database) {
//       print('database opened');
//       getDataFormDatabase(database);
//     }).then((value) {
//       database = value;
//       emit(AppCreateDatabaseState());
//     });
//   }
//
//   insertToDatabase({
//     required String title,
//     required String time,
//     required String date,
//   }) async {
//     await database?.transaction((txn) async {
//       txn
//           .rawInsert(
//         'INSERT INTO tasks(title, date, time,status) VALUES("$title","$date","$time","new")',
//       )
//           .then((value) {
//         print('$value inserted successfully');
//         emit(AppInsertDatabaseState());
//         getDataFormDatabase(database);
//       }).catchError((error) {});
//     });
//   }
//
//   void getDataFormDatabase(database) {
//     newTasks = [];
//     doneTasks = [];
//     archivedTasks = [];
//
//     emit(AppGetDatabaseLoadingState());
//     database!.rawQuery('SELECT * FROM tasks').then(( value) {
//       value.forEach((element) {
//         if (element['status' == 'new']) {
//           newTasks.add(element);
//         } else if (element['status' == 'done']) {
//           doneTasks.add(element);
//         } else {
//           archivedTasks.add(element);
//         }
//       });
//       emit(AppGetDatabaseState());
//     });
//   }
//
//   void changeBottomSheetState({
//     required bool isShow,
//     required IconData icon,
//   }) {
//     isBottomSheetShown = isShow;
//     fabIcon = icon;
//     emit(AppChangeBottomSheetState());
//   }
//
//   void updateData({
//     required String status,
//     required int id,
//   }) async {
//     database!.rawUpdate('UPDATE tasks SET status = ?, WHERE id = ?', [
//       '${status}',
//       '$id',
//     ]).then((value) {
//       getDataFormDatabase(database);
//       emit(AppUpdateDatabaseState());
//     });
//   }
//   void deleteData({
//     required int id,
//   }) async {
//     database!.rawDelete('DELETE FROM takes WHERE id = ?', ['id']).then((value) {
//       getDataFormDatabase(database);
//       emit(AppDeleteDatabaseState());
//     });
//   }
// }
// // import 'package:bloc/bloc.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:mk/shared/cuibt/states.dart';
// // import 'package:sqflite/sqflite.dart';
// //
// // import '../../layout/home_layout.dart';
// // import '../../modules/archivedtasks/archived_tasks_screen.dart';
// // import '../../modules/donetasks/done_tasks_screen.dart';
// // import '../../modules/newtasks/new_tasks_screen.dart';
// // import '../components/constants.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:mk/modules/archivedtasks/archived_tasks_screen.dart';
// // import 'package:mk/modules/donetasks/done_tasks_screen.dart';
// // import 'package:mk/shared/cuibt/states.dart';
// //
// // import 'package:sqflite/sqflite.dart';
// // import 'package:sqflite/sqlite_api.dart';
// //
// // import '../../modules/newtasks/new_tasks_screen.dart';
//
// // class AppCubit extends Cubit<AppStates> {
// //   AppCubit() : super(AppInitialState());
// //
// //   static AppCubit get(context) => BlocProvider.of(context);
// //
// //   int currentIndex = 0;
// //
// //   List<Widget> screens = [
// //     NewTasks(),
// //     DoneTasks(),
// //     ArchivedTasks(),
// //   ];
// //
// //   List<String> titles = [
// //     'New Tasks',
// //     'Done Tasks',
// //     'Archived Tasks',
// //   ];
// //
// //   void changeIndex(int index) {
// //     currentIndex = index;
// //     emit(AppChangeBottomNavBarState());
// //   }
// //
// //   Database database;
// //   List<Map> newTasks = [];
// //   List<Map> doneTasks = [];
// //   List<Map> archivedTasks = [];
// //
// //   void createDatabase() {
// //     openDatabase(
// //       'todo.db',
// //       version: 1,
// //       onCreate: (database, version) {
// //         // id integer
// //         // title String
// //         // date String
// //         // time String
// //         // status String
// //
// //         print('database created');
// //         database
// //             .execute(
// //             'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
// //             .then((value) {
// //           print('table created');
// //         }).catchError((error) {
// //           print('Error When Creating Table ${error.toString()}');
// //         });
// //       },
// //       onOpen: (database)
// //       {
// //         getDataFromDatabase(database);
// //         print('database opened');
// //       },
// //     ).then((value) {
// //       database = value;
// //       emit(AppCreateDatabaseState());
// //     });
// //   }
// //
// //   insertToDatabase({
// //     required String title,
// //     required String time,
// //     required String date,
// //   }) async {
// //     await database.transaction((txn) {
// //       txn
// //           .rawInsert(
// //         'INSERT INTO tasks(title, date, time, status) VALUES("$title", "$date", "$time", "new")',
// //       )
// //           .then((value) {
// //         print('$value inserted successfully');
// //         emit(AppInsertDatabaseState());
// //
// //         getDataFromDatabase(database);
// //       }).catchError((error) {
// //         print('Error When Inserting New Record ${error.toString()}');
// //       });
// //
// //     });
// //   }
// //
// //   void getDataFromDatabase(database)
// //   {
// //     newTasks = [];
// //     doneTasks = [];
// //     archivedTasks = [];
// //
// //     emit(AppGetDatabaseLoadingState());
// //
// //     database.rawQuery('SELECT * FROM tasks').then((value) {
// //
// //       value.forEach((element)
// //       {
// //         if(element['status'] == 'new')
// //           newTasks.add(element);
// //         else if(element['status'] == 'done')
// //           doneTasks.add(element);
// //         else archivedTasks.add(element);
// //       });
// //
// //       emit(AppGetDatabaseState());
// //     });
// //   }
// //
// //   void updateData({
// //     required String status,
// //     required int id,
// //   }) async
// //   {
// //     database.rawUpdate(
// //       'UPDATE tasks SET status = ? WHERE id = ?',
// //       ['$status', id],
// //     ).then((value)
// //     {
// //       getDataFromDatabase(database);
// //       emit(AppUpdateDatabaseState());
// //     });
// //   }
// //
// //   void deleteData({
// //     required int id,
// //   }) async
// //   {
// //     database.rawDelete('DELETE FROM tasks WHERE id = ?', [id])
// //         .then((value)
// //     {
// //       getDataFromDatabase(database);
// //       emit(AppDeleteDatabaseState());
// //     });
// //   }
// //
// //   bool isBottomSheetShown = false;
// //   IconData fabIcon = Icons.edit;
// //
// //   void changeBottomSheetState({
// //     required bool isShow,
// //     required IconData icon,
// //   }) {
// //     isBottomSheetShown = isShow;
// //     fabIcon = icon;
// //
// //     emit(AppChangeBottomSheetState());
// //   }
// // }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mk/modules/todo_app/archivedtasks/archived_tasks.dart';
import 'package:mk/modules/todo_app/donetasks/done_tasks.dart';
import 'package:mk/modules/todo_app/newtasks/new_task.dart';
import 'package:mk/shared/cuibt/states.dart';
import 'package:mk/shared/network/local/cache_helper.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archivedTasks = [];

  Database? database;
  List titles = [
    "New Tasks",
    "Done Tasks",
    "Archived Tasks",
  ];
  List<Widget> screens = [
    NewTask1(),
    DoneTask1(),
    ArchivedTask1(),
  ];
  void changeIndex(int index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  createDatabase() {
    openDatabase('todo.db', version: 1,
        onCreate: (Database database, int version) {
      print('database created ');
      database
          .execute(
              'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT,date TEXT, time TEXT, status TEXT)')
          //'CREATE TABLE tasks(id INTEGER PRIMARY KEY ,title TEXT,date TEXT ,time TEXT,status TEXT)'
          .then((value) {
        print('table created ');
      }).catchError((onError) =>
              print('error on create tabel ${onError.toString()} '));
    }, onOpen: (database) {
      print('database opened ');
      getDataFromDatabase(database);
    }).then((value) {
      database = value;
      emit(AppCreateDatabaseState());
    });
  }

  insertToDatabase({
    required title,
    required date,
    required time,
  }) async {
    await database?.transaction((txn) async {
      txn
          .rawInsert(
              'INSERT INTO tasks(title, date, time,status) VALUES("$title","$date","$time","new")')
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertDatabaseState());
        getDataFromDatabase(database);
      }).catchError((onError) {});
    });
  }

  void getDataFromDatabase(database) {
    newTasks = [];
    doneTasks = [];
    archivedTasks = [];
    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new') {
          newTasks.add(element);
        } else if (element['status'] == 'done') {
          doneTasks.add(element);
        } else {
          archivedTasks.add(element);
        }
      });
      emit(AppGetFromDatabaseState());
    });
  }

  bool isBottomSheetShown = false;
  IconData fabIcon = Icons.edit;
  void changeBottomSheet({required bool isShow, required IconData icon}) {
    isBottomSheetShown = isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());
  }

  void updateDatabase({
    required String status,
    required int id,
  }) {
    database?.rawUpdate(
        'UPDATE tasks SET status = ? WHERE id = ?', [status, id]).then((value) {
      getDataFromDatabase(database);
      emit(AppDeleteDatabaseState());
    });
  }

  Future<void> deleteDatabase({
    required int id,
  }) async {
    await database?.rawDelete('DELETE FROM tasks WHERE id = ?', [id]);
    getDataFromDatabase(database);
    emit(AppUpdateDatabaseState());
  }

  //News App //////
  bool isDark = false;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(NewsAppChangeModeStates());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(NewsAppChangeModeStates());
      });
    }
  }
}
