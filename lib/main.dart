import 'package:flutter/material.dart';


void main() => runApp(const MaterialApp(home: ToDo()));

class ToDo extends StatefulWidget {
  const ToDo({super.key});

  
  @override
  _ToDoState createState() => _ToDoState();
}

class _ToDoState extends State<ToDo> {
  

  Map<String, bool> products = {
    'Wasser': false, 
    'Käse': false, 
    'Milch': false, 
    'Paprika': false ,
    'Saft': false
    };

  void addItem(String item) {
    setState(() {
      products[item] = false;
    });
    Navigator.of(context).pop();
  }

  void deleteItem(String key) {
    setState(() {
      products.remove(key);
    });
  }

  void toggleDone(String key) {
    setState(() {
      products.update(key, (bool done) => !done);
    });
  }

  void newEntry() {
    showDialog<AlertDialog>(
      context: context,
      builder: (BuildContext context) {
        return AddItemDialog(addItem);
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Einkausliste"),
          backgroundColor: const Color.fromRGBO(35, 152, 185, 100),
        ),
        body:
          ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, i) {
              String key = products.keys.elementAt(i);
              return ToDoItem(
                key,
                products[key]!,
                () => deleteItem(key),
                () => toggleDone(key),
              );
            },
          ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            newEntry(
            );
          },
          backgroundColor: const Color.fromRGBO(35, 152, 185, 100),
          child: const Icon(Icons.add),
        ),
    );
  }
}

class ToDoItem extends StatelessWidget {
  final String title;
  final bool done;
  final Function remove;
  final Function toggleDone;
  const  ToDoItem(this.title, this.done, this.remove, this.toggleDone, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.symmetric(horizontal: 22),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(vertical: 8.0),
        leading: Checkbox(
          value: done,
          onChanged: (bool? value) => toggleDone(),
          activeColor: const Color.fromRGBO(23, 152, 185, 100),
        ),
        title: Text(
          title,
          style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: done
                ? const Color.fromRGBO(23, 152, 185, 100)
                : Colors.black54,
            decoration: done
                ? TextDecoration.lineThrough
                : TextDecoration.none,),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline),
          onPressed: () => remove(),
        )
      ),
    );
  }
}

class AddItemDialog extends StatefulWidget {

  final void Function(String txt) addItem;
  const AddItemDialog(this.addItem, {super.key});

  @override
  _AddItemDialogState createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {

  final GlobalKey<FormState> formKey = GlobalKey();
  late String item;

  void save() {
    if (formKey.currentState!.validate()) {
      widget.addItem(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              onChanged: (String txt) => item = txt,
              onFieldSubmitted: (String txt) => save(),
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Eingabe';
                }
                return null;
              },
            ),
            ElevatedButton(
             style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.white)),


              onPressed: save,
              child: const Text('Speichern', 
              style: TextStyle(
                color: Color.fromARGB(255, 67, 35, 212),
                ),
                ),
            )
          ],
        )
      ),
    );
  }
  }