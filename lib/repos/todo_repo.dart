import 'package:shared_preferences/shared_preferences.dart';

class ToDoRepository {
  static const String _todo = "todo";
  static const String _like = "like";

  final SharedPreferences _preferences;

  ToDoRepository(this._preferences);

  Future<void> setTodo(String value) async {
    _preferences.setString(_todo, value);
  }

  Future<void> setLike(bool value) async {
    _preferences.setBool(_like, value);
  }

  bool isLike() {
    return _preferences.getBool(_like) ?? false;
  }
}
