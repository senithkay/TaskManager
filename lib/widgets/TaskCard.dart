import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Models/Task.dart';


class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
              )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration:  BoxDecoration(
                      color:(task.category == 1)? Colors.blue.withOpacity(0.2) : ((task.category == 2)? Colors.red.withOpacity(0.2): Colors.purple.withOpacity(0.2)),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: (task.category == 1)? const Icon(Icons.phone) : ((task.category == 2)? const Icon(Icons.people): const Icon(CupertinoIcons.paperclip)),
                  ),

                  Container(
                    padding: const EdgeInsets.all(20.0),
                    width: MediaQuery.of(context).size.width*0.5,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(task.title,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700
                              ),),
                            Text(task.description,
                              style: TextStyle(color: Colors.white.withOpacity(0.5)),
                            ),
                          ],
                        ),

                        Text(task.dueDate,
                          style: TextStyle(color: Colors.white.withOpacity(0.5)),
                        )
                      ],
                    ),
                  )
                ],
              ), //main data
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 80,
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(onPressed: ()=>{}, icon: const Icon(Icons.edit), iconSize: 20,),
                        IconButton(onPressed: ()=>{}, icon: const Icon(Icons.more_vert), iconSize: 20,),
                      ],
                    ),
                  ),
                  Text("High priority",
                    style: TextStyle(
                      color: (task.priority == 1)? Colors.red : ((task.priority == 2)? Colors.yellow: Colors.green),
                      fontSize: 10.0,
                    ),),
                ],
              ), //buttons and options
            ],
          )),
    );
  }
}
