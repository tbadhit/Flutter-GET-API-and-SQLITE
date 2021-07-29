import 'package:receipe_app/model/meal.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' as io;
import 'package:path/path.dart';

class DBHelper {
  // 1.
  DBHelper._createInstance();

  // 2.
  static final DBHelper _instance = DBHelper._createInstance();

  // 3.
  factory DBHelper() => _instance;

  // 4.
  static Database? _db;

  // 7.
  Future<Database?> get db async {
    _db = await setDB();
    return _db ?? _db;
  }

  // 5.
  setDB() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "mealsDb");
    var dB = await openDatabase(path, version: 1, onCreate: _onCreate);
    return dB;
  }

  // 6.
  void _onCreate(Database db, int version) async {
    var sql =
        "CREATE TABLE favorite(id INTEGER PRIMARY KEY, idMeal TEXT,  strMeal TEXT, strInstructions TEXT, strMealThumb TEXT, strCategory TEXT)";
    await db.execute(sql);
    print('DB Created');
  }

  // 8.
  Future<int> insert(Meal meals) async {
    var dbClient = await db;
    int res = await dbClient!.insert("favorite", meals.toJson()).then((i) {
      return 1;
    });
    if (res == 1) {
      print("Favorite data inserted");
    }
    return res;
  }

  Future<Meal> get(String idMeal) async {
    var dbClient = await db;
    var sql = "SELECT * FROM favorite WHERE idMeal=? ORDER BY idMeal DESC";
    List<Map> list = await dbClient!.rawQuery(sql, [idMeal]);
    late Meal meals;
    if (list.length > 0) {
      meals = Meal(
          idMeal: list[0]['idMeal'],
          strMeal: list[0]['strMeal'],
          strInstructions: list[0]['strInstructions'],
          strMealThumb: list[0]['strMealThumb'],
          strCategory: list[0]['strCategory']);
    }
    return meals;
  }

  Future<List<Meal>> gets(String category) async {
    var dbClient = await db;
    var sql = "SELECT * FROM favorite WHERE strCategory=? ORDER BY idMeal DESC";
    List<Map> list = await dbClient!.rawQuery(sql, [category]);
    List<Meal> favorites = [];
    for (int i = 0; i < list.length; i++) {
      Meal favorite = Meal(
        idMeal: list[i]["idMeal"],
        strMeal: list[i]["strMeal"],
        strInstructions: list[i]["strInstructions"],
        strMealThumb: list[i]["strMealThumb"],
        strCategory: list[i]["strCategory"],
      );
      favorite.setFavoriteId(list[i]['idMeal']);
      favorites.add(favorite);
    }
    return favorites;
  }

  Future<List<Meal>> filter(String filter) async {
    var dbClient = await db;
    var sql =
        "SELECT * FROM favorite WHERE strMeal Like ? ORDER BY idMeal DESC";
    List<Map> list = await dbClient!.rawQuery(sql, ["%$filter%"]);
    List<Meal> favorites = [];
    for (int i = 0; i < list.length; i++) {
      Meal favorite = Meal(
        idMeal: list[i]["idMeal"],
        strMeal: list[i]["strMeal"],
        strInstructions: list[i]["strInstructions"],
        strMealThumb: list[i]["strMealThumb"],
        strCategory: list[i]["strCategory"],
      );
      favorite.setFavoriteId(list[i]['idMeal']);
      favorites.add(favorite);
    }
    return favorites;
  }

  Future<int> delete(Meal meals) async {
    var dbClient = await db;
    var sql = "DELETE FROM favorite WHERE idMeal = ?";
    int res = await dbClient!.rawDelete(sql, [meals.idMeal]);
    print("Favorite data deleted");
    return res;
  }

  Future<bool> isFavorite(String? idMeals) async {
    var dbClient = await db;
    var sql = "SELECT * FROM favorite WHERE idMeal = ?";
    var res = await dbClient!.rawQuery(sql, [idMeals]);

    return res.isNotEmpty;
  }
}
