import 'package:flutter/material.dart';



class CreateTask extends StatefulWidget {
  const CreateTask({Key? key}) : super(key: key);

  @override
  State<CreateTask> createState() => _State();
}

class _State extends State<CreateTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Create a new task",
          style: TextStyle(
              fontWeight: FontWeight.w700
          ),),
      ),
      body: Column(
        children: [
          const Text("Enter details here"),
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          }, child: const CreateForm()),
        ],
      ),

    );
  }
}


class CreateForm extends StatefulWidget {
  const CreateForm({Key? key}) : super(key: key);

  @override
  State<CreateForm> createState() => _CreateFormState();
}

class _CreateFormState extends State<CreateForm> {
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  int priority = 1;
  Map<String , int> priorityValue = {
    "High" : 1,
    "Medium" : 2,
    "Low" : 3,
  };

  List<String> list = ["High", "Medium", "Low"];

  @override
  void dispose(){
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
        child: Container(
          height: 500,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Enter a title"
                ),
                controller: titleController,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Enter a title";
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Enter a description"
                ),
                controller: descriptionController,
                validator: (value){
                  if(value == null || value.isEmpty){
                    return "Enter a description";
                  }
                  return null;
                },
              ),

              Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButton(
                      items:list.map((String item) => DropdownMenuItem(
                      value: priorityValue[item],
                      child: Text(item),
                  )).toList(), onChanged: (int ? value){
                    setState(() {
                      priority = value!;
                      print(priority);
                    });
                  }),
                ],
              ),
              ElevatedButton(onPressed: (){
                if(_formKey.currentState!.validate()){
                  ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(content: Text(descriptionController.text)),
                  );
                }
              }, child: const Text("Submit")),
            ],
          ),
        ),
    );
  }
}

