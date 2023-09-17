import 'package:flutter/material.dart';

class SubDetail extends StatefulWidget {
  const SubDetail({super.key});

  @override
  State<SubDetail> createState() => _SubDetailState();
}

class _SubDetailState extends State<SubDetail> {
  List<String> todoList = List.empty(growable: true);

  void _addNavigation(BuildContext context) async {
    final result = await Navigator.of(context).pushNamed('/second');
    setState(() {
      todoList.add(result as String);
    });
  }

  @override
  void initState() {
    super.initState();
    todoList.add('스터디 공부');
    todoList.add('클론 코딩');
    todoList.add('파이어베이스 구현');
    todoList.add('복습 및 블로그 포스팅');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sub Detail Example'),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return Card(
            elevation: 2,
            child: InkWell(
              //탭, 더블탭, 롱탭 등 다양한 터치 이벤트를 처리할 수 있는 위젯
              child: Text(
                '${index + 1}. ${todoList[index]}',
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              onTap: () {
                Navigator.of(context)
                    .pushNamed('/third', arguments: todoList[index]);
              },
            ),
          );
        }),
        itemCount: todoList.length,
      ),
      floatingActionButton: FloatingActionButton(
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
