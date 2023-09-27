import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Task.dart';
import 'package:flutter_application_1/views/CreateTask.dart';
import 'package:flutter_application_1/widgets/TaskCard.dart';
import 'package:intl/intl.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 2;
  DateTime now = DateTime.now();
  String getFormattedMonth() {
    String formattedMonth = DateFormat.MMM().format(now);
    return formattedMonth;
  }

  final List<Task> tasks = [
    Task(
        title: "Task 1",
        description: "Task description is here",
        dueDate: "2023-03-30", priority: 1,
        category: 1),


    Task(
        title: "Task 2",
        description: "Task description is here",
        dueDate: "2023-02-30", priority: 2,
        category: 2),

    Task(
        title: "Task 3",
        description: "Task description is here",
        dueDate: "2023-05-30", priority: 3,
        category: 3),];

  void _incrementCounter() {
    setState(() {
      _counter++;
      tasks.add( Task(
          title: "Task $_counter",
          description: "Task description is here",
          dueDate: "2023-0-30", priority: 1,
          category: 1),);
    });

    Navigator.push(context, MaterialPageRoute(builder: (context)=>const CreateTask()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("${getFormattedMonth()} ${now.year}",
          style: const TextStyle(
              fontWeight: FontWeight.w700
          ),),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,

            children: tasks.map((task){
              return TaskCard(
                  task: task
              );
            }).toList()
            ,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
