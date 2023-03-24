// import 'dart:io';
// import 'package:path_provider/path_provider.dart';
// import 'package:e_commerce_project/Model/products.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

 
// class DataBase {
//   Future<Database> initializedDB() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory(); 
//     var path = join(documentsDirectory.path);
//     String patha = await getDatabasesPath();
//     return openDatabase(
//       join(path, 'foods.db'),
//       version: 1,
//       onCreate: (Database db, int version) async {
//         await db.execute(
//           "CREATE TABLE planets(id INTEGER PRIMARY KEY , name TEXT,rating INTEGER,price INTEGER,image TEXT,description TEXT,positionInList INTERGER)",
//         );
//       },
//     );
//   }
 
//   // insert data
//   Future<int> insertPlanets(List<ProductDetails> planets) async {
//     int result = 0;
//     final Database db = await initializedDB();
//     for (var planet in planets) {
//       result = await db.insert('planets', planet.toJson(),
//           conflictAlgorithm: ConflictAlgorithm.replace);
//     }
 
//     return result;
//   }
 
//   // retrieve data
//   Future<List<ProductDetails>> retrievePlanets() async {
//     final Database db = await initializedDB();
//     final List<Map<String, Object?>> queryResult = await db.query('planets');
//     return queryResult.map((e) => ProductDetails.fromJson(e)).toList();
//   }
 
//   // // delete user
//   // Future<void> deletePlanet(int id) async {
//   //   final db = await initializedDB();
//   //   await db.delete(
//   //     'planets',
//   //     where: "id = ?",
//   //     whereArgs: [id],
//   //   );
//   // }
// }
import 'package:e_commerce_project/Model/products.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  // Singleton pattern
  static final DatabaseService _databaseService = DatabaseService._internal();
  factory DatabaseService() => _databaseService;
  DatabaseService._internal();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // Initialize the DB first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();

    final path = join(databasePath, 'flutter_sqflite_database.db');

    
    return await openDatabase(
      path,
      onCreate: _onCreate,
      version: 1,
      onConfigure: (db) async => await db.execute('PRAGMA foreign_keys = ON'),
    );
  }

 
  Future<void> _onCreate(Database db, int version) async {
   
    await db.execute(
      'CREATE TABLE breeds(id INTEGER PRIMARY KEY, description TEXT,image TEXT,name TEXT,positionInList INTEGER,price INTEGER,ratingCount INTEGER,ratingValue INTEGER)',
    );
    
  }

  
  Future<void> insertBreed(ProductDetails breed) async {
   
    final db = await _databaseService.database;

    
    await db.insert(
      'breeds',
      breed.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  

  
  Future<List<ProductDetails>> breeds() async {
   
    final db = await _databaseService.database;

    // Query the table for all the Breeds.
    final List<Map<String, dynamic>> maps = await db.query('breeds');

    // Convert the List<Map<String, dynamic> into a List<Breed>.
    return List.generate(maps.length, (index) => ProductDetails.fromJson(maps[index]));
  }

  Future<ProductDetails> breed(int id) async {
    final db = await _databaseService.database;
    final List<Map<String, dynamic>> maps =
        await db.query('breeds', where: 'id = ?', whereArgs: [id]);
    return ProductDetails.fromJson(maps[0]);
  }

  

  // A method that updates a breed data from the breeds table.
  Future<void> updateBreed(ProductDetails breed) async {
    // Get a reference to the database.
    final db = await _databaseService.database;

    // Update the given breed
    await db.update(
      'breeds',
      breed.toJson(),
      // Ensure that the Breed has a matching id.
      where: 'id = ?',
      // Pass the Breed's id as a whereArg to prevent SQL injection.
      whereArgs: [breed.id],
    );
  }

 

  Future<void> deleteDog(int id) async {
    final db = await _databaseService.database;
    await db.delete('dogs', where: 'id = ?', whereArgs: [id]);
  }
}
