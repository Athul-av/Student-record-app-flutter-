import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_sample/db/functions/db_functions.dart';
import 'package:hive_sample/db/models/data_model.dart';


// ignore: must_be_immutable
class ScreenInput extends StatelessWidget {
  ScreenInput({super.key});
  final _stdnameController = TextEditingController();
  final _stdageController = TextEditingController();
  final _placeController = TextEditingController();
  final _numberController = TextEditingController();
  String imageAdd = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromARGB(255, 148, 136, 27),
      appBar: AppBar(
        flexibleSpace: Container(decoration:const BoxDecoration(
          gradient:LinearGradient(colors: [Color.fromARGB(255, 244, 54, 127),Color.fromARGB(255, 57, 198, 200)])
        ),),
        centerTitle: true,
        elevation: 3,

        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back),
        ),
        leadingWidth: 56,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
       
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _stdnameController,
                
                decoration: const InputDecoration(
                  
                  label: Text('Name'),
                    hintText: ("Student Name"), border: OutlineInputBorder(
                      borderRadius:BorderRadius.all(Radius.circular(10.0))
                    ),
                    prefixIcon: Icon(Icons.person)
                    ),
              ),
              const SizedBox(
                height: 18,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _stdageController,
                decoration: const InputDecoration(
                  label: Text('Age'),
                  prefixIcon: Icon(Icons.calendar_view_day),
                    hintText: ("Student Age"), border: OutlineInputBorder(
                      borderRadius:BorderRadius.all(Radius.circular(10.0))
                    )),
              ),
              const SizedBox(
                height: 18,
              ),
              TextFormField(
                controller: _placeController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.place ),
                  label: Text('Place'),
                    hintText: ("Enter place"), border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                    )),
              ),
              const SizedBox(
                height: 18,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: _numberController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.phone),
                  label: Text('Phone Number'),
                    hintText: ("Phone Number"), border: OutlineInputBorder(
                      borderRadius:BorderRadius.all(Radius.circular(10.0))
                    )),
              ),
              const SizedBox(
                height: 18,
              ),
              ElevatedButton.icon(
                onPressed: () {
                  addStudentButtonClicked(context);
                },
                icon: const Icon(Icons.save),
                label: const Text('SAVE'),
                style:ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(255, 57, 198, 200),
                ) 
                ,
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      )),
    );
  }

  addStudentButtonClicked(BuildContext context) async {
    final _name = _stdnameController.text.trim();
    final _age = _stdageController.text.trim();
    final _place = _placeController.text.trim();
    final _number = _numberController.text.trim();
    if (_name.isEmpty || _age.isEmpty || _place.isEmpty || _number.isEmpty) {
      return Get.snackbar('Warning', "All field is required",
          snackPosition: SnackPosition.BOTTOM);
    } else {
      //print('$_name $_age $_class $_adnum');
      _stdnameController.clear();
      _stdageController.clear();
      _placeController.clear();
      _numberController.clear();
      final _student =
          StudentModel(name: _name, age: _age, place: _place, number: _number);
      addStudent(_student);
      Get.back();
      Get.snackbar(' ', "Student detail added successfully",
          snackPosition: SnackPosition.BOTTOM);
      // Navigator.of(context).pop();
    }
  }


}































// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:hive_sample/db/functions/db_functions.dart';
// import 'package:hive_sample/db/models/data_model.dart';
// import 'package:hive_sample/screen/screen_list.dart';

// class ScreenInput extends StatelessWidget {
//   ScreenInput({super.key});
//   final _stdnameController = TextEditingController();
//   final _stdageController = TextEditingController();
//   final _classController = TextEditingController();
//   final _admissionController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Column(
//       children: [
//         const SizedBox(
//           height: 15,
//         ),
//         TextFormField(
//           controller: _stdnameController,
//           decoration: const InputDecoration(
//               hintText: ("Student Name"), border: OutlineInputBorder()),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         TextFormField(
//           controller: _stdageController,
//           decoration: const InputDecoration(
//               hintText: ("Student Age"), border: OutlineInputBorder()),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         TextFormField(
//           controller: _classController,
//           decoration: const InputDecoration(
//               hintText: ("Enter The Class"), border: OutlineInputBorder()),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         TextFormField(
//           controller: _admissionController,
//           decoration: const InputDecoration(
//               hintText: ("Admission Number"), border: OutlineInputBorder()),
//         ),
//         const SizedBox(
//           height: 15,
//         ),
//         ElevatedButton.icon(
//           onPressed: () {
//             addStudentButtonClicked();
//           },
//           icon: const Icon(Icons.save),
//           label: const Text('SAVE'),
//         ),
//         TextButton.icon(
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//           icon: const Icon(Icons.skip_previous),
//           label: const Text('Back'),
//           style: TextButton.styleFrom(
//             foregroundColor: Colors.black,
//           ),
//         )
//       ],
//     ));
//   }
// }

// Future<void> addStudentButtonClicked() async {
//   // final _name = _std
//   // final _age = _stdageController.text.trim();
//   // final _class = _classController.text.trim();
//   // final _adnum = _admissionController.text.trim();
// final _name = _std
//   if (_name.isEmpty || _age.isEmpty || _class.isEmpty || _adnum.isEmpty) {
//     return;
//   } else {
//     //print('$_name $_age $_class $_adnum');
//     final _student =
//         StudentModel(name: _name, age: _age, class_: _class, adnum: _adnum);
//     addStudent(_student);
//   }
// }
