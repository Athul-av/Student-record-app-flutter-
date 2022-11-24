import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_sample/db/models/data_model.dart';
import 'package:hive_sample/screen/screen_update.dart';

import '../db/functions/db_functions.dart';

class ScreenList extends StatelessWidget {
  const ScreenList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.all(10),
      child: ValueListenableBuilder(
        valueListenable: studentdataNotifier,
        builder:
            (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
          return ListView.separated(
            
              itemBuilder: (context, index) {
                final data = studentList[index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScreenUpdate(
                                  data: data,
                                  index: index,
                                )));
                  },
                  title: Text(data.name),
                  subtitle: Text('Age: ${data.age}'),
                  trailing: IconButton(
                      onPressed: () {
                        // deleteStudent(index);
                        Get.defaultDialog(
                          title: 'Delete',
                          content: 
                           const Text(
                              'Are you sure you want to delete this item.',
                            ),
                          
                          
                          onCancel: () => Get.back(),
                          onConfirm:() {
                            deleteStudent(index);
                            Get.back();
                          },
                          confirmTextColor: Colors.black,
                          cancelTextColor: 
                          Colors.black,
                        );
                      },
                      icon:const Icon(Icons.delete)),
                  leading: const CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 57, 198, 200),
                    radius: 30,
                    child: Icon(Icons.person, size: 30 ,color:Colors.white,),
                   // backgroundImage: AssetImage('lib/asset/th.jpeg'),
                   
                  ),
                );
              },
              separatorBuilder: (ctx, index) {
                return const Divider();
              },
              itemCount: studentList.length);
        },
      ),
    );
  }
}
