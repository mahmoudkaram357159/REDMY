// FloatingActionButton(
// backgroundColor: Colors.lightGreen,
// //splashColor: Colors.red,
// foregroundColor: Colors.white,
// onPressed: () {
// if (cubit.isBottomSheetShown) {
// if (formKey.currentState!.validate()) {
// cubit.insertToDatabase(
// title: titleController.text,
// date: dateController.text,
// time: timeController.text)
// ;
// // insertToDatabase(
// //         title: titleController.text,
// //         date: dateController.text,
// //         time: timeController.text)
// //     .then((value) {
// //   getDataFromDatabase(database).then((value) {
// //     // setState(() {
// //     //   tasks = value;
// //     //   print(tasks);
// //     //
// //     //   Navigator.pop(context);
// //     // });
// //   });
// // });
// }
// } else {
// scaffoldKey.currentState
//     ?.showBottomSheet(
// (context) => Container(
// padding: EdgeInsets.all(10.0),
// color: Colors.white10,
// child: Form(
// key: formKey,
// child: Column(
// mainAxisSize: MainAxisSize.min,
// children: [
// defaultFormFiled(
// onTap: () {},
// controller: titleController,
// type: TextInputType.text,
// validate: (String? value) {
// if (value!.isEmpty) {
// return 'title must not be empty';
// }
// },
// label: "Task Title",
// prefix: Icons.title),
// SizedBox(
// height: 9.0,
// ),
// defaultFormFiled(
// onTap: () {
// showTimePicker(
// context: context,
// initialTime: TimeOfDay.now())
//     .then((value) {
// timeController.text =
// value!.format(context).toString();
// print(timeController.text);
// });
// },
// controller: timeController,
// type: TextInputType.datetime,
// validate: (String? value) {
// if (value!.isEmpty) {
// return 'time must not be empty';
// }
// },
// label: "Task time",
// prefix: Icons.timer_outlined),
// SizedBox(
// height: 9.0,
// ),
// defaultFormFiled(
// onTap: () {
// showDatePicker(
// context: context,
// initialDate: DateTime.now(),
// firstDate: DateTime.now(),
// lastDate:
// DateTime.parse('2050-12-29'))
//     .then((value) {
// dateController.text =
// DateFormat.yMMMd().format(value!);
// print(dateController.text);
// });
// },
// controller: dateController,
// type: TextInputType.datetime,
// validate: (String? value) {
// if (value!.isEmpty) {
// return 'date must not be empty';
// }
// },
// label: "Task date",
// prefix: Icons.calendar_today)
// ],
// ),
// ),
// ),
// )
//     .closed
//     .then((value) {
// cubit.changeBottomSheet(isShow: false, icon: Icons.edit);
// });
// cubit.changeBottomSheet(isShow: true, icon: Icons.add);
// }
// },
// child: Icon(
// cubit.fabIcon,
// ),
// ),

import 'package:flutter/material.dart';

Color k = Color(0xFFC74B50);
Color r = Color(0xffD49B54);
String? token = '';

void printFullText(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
