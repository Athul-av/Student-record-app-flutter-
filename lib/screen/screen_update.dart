import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_sample/db/functions/db_functions.dart';
import 'package:hive_sample/db/models/data_model.dart';

class ScreenUpdate extends StatefulWidget {
  ScreenUpdate({
    super.key,
    required this.data,
    required this.index,
  });
  final StudentModel data;
  int index;

  @override
  State<ScreenUpdate> createState() => _ScreenUpdateState();
}

class _ScreenUpdateState extends State<ScreenUpdate> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController ageController = TextEditingController();

  final TextEditingController  placController = TextEditingController();

  final TextEditingController numbController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  void initState() {
    nameController.text = widget.data.name;
    ageController.text = widget.data.age;
    placController.text = widget.data.place;
    numbController.text = widget.data.number;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
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
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                     prefixIcon: Icon(Icons.person),
                      label: Text('Name'),
                      hintText: ("Student Name"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Student name is empty';
                    }
                    return null;
                  },
                ),
               const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: ageController,
                  decoration: const InputDecoration(
                     prefixIcon: Icon(Icons.calendar_view_day),
                      label: Text('Age'),
                      hintText: ("Student Age"),
                      border: OutlineInputBorder(
                         borderRadius: BorderRadius.all(Radius.circular(10))
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Student age is empty';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: placController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.place ),
                      label: Text('Place'),
                      hintText: ("Enter Place"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Student place is empty';
                    }
                    return null;
                  },
                ),
               const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: numbController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                      label: Text('Phone Number'),
                      hintText: ("Phone Number"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Student admission number is empty';
                    }
                    return null;
                  },
                ),
              const  SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      updateStudentFunctin();
                    },
                    child:const Text(
                      'Update',
                    ))
              ],
            ),
          ),
        ));
  }

  void updateStudentFunctin() {
    if (formkey.currentState!.validate()) {
      final name = nameController.text.trim();
      final age = ageController.text.trim();
      final place = placController.text.trim();
      final number = numbController.text.trim();
      final student = StudentModel(
        name: name,
        age: age,
        place :place,
        number: number,
      );
      updateStudent(
        widget.index,
        student,
      );
      Get.back();
      Get.snackbar(
        ' ',
        'student updated succesfully',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
