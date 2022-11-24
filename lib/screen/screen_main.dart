import 'package:flutter/material.dart';
import 'package:hive_sample/screen/screen_input.dart';
import 'package:hive_sample/screen/screen_list.dart';
import 'package:hive_sample/screen/search.dart';

class ScreenMain extends StatelessWidget {
  ScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      appBar: AppBar(
        flexibleSpace: Container(decoration:const BoxDecoration(
          gradient: LinearGradient(colors: [Color.fromARGB(255, 244, 54, 127),Color.fromARGB(255, 57, 198, 200)])
        ),),
        title: const Text('STUDENT LIST'),
        centerTitle: true,
        elevation: 3,
        leading: const Icon(
          Icons.school,
        ),
        leadingWidth: 56,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchProfile(),);
            },
            icon:const Icon(
              Icons.search,
            ),
          ),
        
        ],
        
      ),
      body: SafeArea(
          child: Container( 
        child: ScreenList(),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ScreenInput()));
        },
        tooltip: 'New Data',
        child: Icon(Icons.person_add),
        backgroundColor: Color.fromARGB(255, 57, 198, 200),
       // splashColor: Colors.black,
        elevation: 5,
      ),
    );
  }

  
}
