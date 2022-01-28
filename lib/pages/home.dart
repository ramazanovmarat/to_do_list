import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _userTodo = '';
  List todo = [];
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    todo.addAll(['Buy milk', 'Wash dishes', 'Create app', ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Text('To do List'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: todo.length,
          itemBuilder: (BuildContext context, int index){
            return Dismissible(
                key: Key(todo[index]),
                child: Card(
                  child: ListTile(title: Text(todo[index]),
                    trailing: IconButton(
                      icon: const Icon(
                          Icons.delete_forever,
                      color: Colors.deepPurple,),
                      onPressed: () {
                        setState(() {
                          todo.removeAt(index);
                        });
                      },),
                  ),
                ),
                onDismissed: (direction){
                  // if(direction == DismissDirection.endToStart){}
                  setState(() {
                    todo.removeAt(index);
                  });
                },
            );
          }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: (){
         showDialog(context: context, builder: (BuildContext context) {
           return AlertDialog(
             title: const Text('Add element'),
             content: TextField(
               onChanged: (String value){
                 _userTodo = value;
               },
             ),
             actions: [
               ElevatedButton(onPressed: (){
                 setState(() {
                   todo.add((_userTodo));
                 });
                 Navigator.of(context).pop();
               }, child: const Text('Add'),
               ),
             ],
           );
         });
        },
        child: const Icon(
          Icons.add_box,
          color: Colors.white,
        ),
      ),
    );
  }
}
