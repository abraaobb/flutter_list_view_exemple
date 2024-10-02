import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database? _db;

  DatabaseHelper.internal();

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), "mydatabase.db");
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  // Função de criação de tabelas
  void _onCreate(Database db, int newVersion) async {
    await db.execute(
        "CREATE TABLE user(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)");
  }

  // Inserir dados
  Future<int> saveUser(Map<String, dynamic> user) async {
    var dbClient = await db;
    return await dbClient.insert("user", user);
  }

  // Recuperar todos os usuários
  Future<List<Map<String, dynamic>>> getAllUsers() async {
    var dbClient = await db;
    return await dbClient.query("user");
  }

  // Deletar usuário
  Future<int> deleteUser(int id) async {
    var dbClient = await db;
    return await dbClient.delete("user", where: "id = ?", whereArgs: [id]);
  }

  // Atualizar usuário
  Future<int> updateUser(Map<String, dynamic> user) async {
    var dbClient = await db;
    return await dbClient
        .update("user", user, where: "id = ?", whereArgs: [user['id']]);
  }
}
