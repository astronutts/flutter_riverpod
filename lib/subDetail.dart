import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study_0915/view_models/todo_vm.dart';

class SubDetail extends ConsumerStatefulWidget {
  const SubDetail({super.key});

  @override
  ConsumerState<SubDetail> createState() => _SubDetailState();
}

class _SubDetailState extends ConsumerState<SubDetail> {
  List<String> todoList = List.empty(growable: true);

  void _addNavigation(BuildContext context) {
    Navigator.of(context).pushNamed('/second');
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'Discipline List',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return Card(
            elevation: 2,
            child: Text(
              ref.watch(todoProvider).todo,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          );
        }),
        itemCount: todoList.length,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          _addNavigation(context);
        },
        child: const Icon(
          Icons.add,
        ),
      ),
    );
  }
}
