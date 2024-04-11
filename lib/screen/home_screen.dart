import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/todo_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: Consumer<TodoProvider>(
        builder: (context, value, _) {
          final todoProvider = value;
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemBuilder: (context, index) {
                    final item = todoProvider.dummyList[index];
                    return ListTile(
                      onLongPress: () {
                        todoProvider.removeTodo(item);
                      },
                      title: Text(item.title),
                      subtitle: Text(item.description),
                      trailing: Checkbox(
                        onChanged: (val) {
                          if (val != null) {
                            todoProvider.todoToggler(item, boolean: val);
                          }
                        },
                        value: item.isDone,
                      ),
                    );
                  },
                  itemCount: todoProvider.dummyList.length,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: todoProvider.titleController,
                        decoration: const InputDecoration(hintText: "Title"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: todoProvider.descriptionController,
                        decoration:
                            const InputDecoration(hintText: "Description"),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: () {
                            todoProvider.addTodo();
                          },
                          child: const Text("Add todo"))
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
