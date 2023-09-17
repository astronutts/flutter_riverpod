import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_study_0915/view_models/todo_vm.dart';

class SecondDetail extends ConsumerWidget {
  const SecondDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('Drop your Discipline'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: controller,
                keyboardType: TextInputType.text,
              ),
              ElevatedButton(
                onPressed: () {
                  ref.watch(todoProvider.notifier).setTodo(controller.text);
                  print(ref.watch(todoProvider));
                  Navigator.of(context).pop();
                },
                child: const SizedBox(
                  width: 200,
                  child: Text(
                    textAlign: TextAlign.center,
                    'Register',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
