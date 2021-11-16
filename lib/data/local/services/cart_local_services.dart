import 'package:get_meat_apps/data/local/get_meat_databases.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class CartLocalServices {
  static const _tableName = 'carts';

  static const _columnId = 'id';
  static const _columnProductId = 'product_id';
  static const _columnProductName = 'product_name';
  static const _columnProductPrice = 'product_price';
  static const _columnQuantity = 'quantity';
  static const _columnPhotoProduct = 'photo_product';
  static const _columnDescriptioOrder = 'description';
  static const _columnSellerId = 'seller_id';

  void onCreateCartTable(Batch batch) async {
    batch.execute('''
      Create Table $_tableName (
        $_columnId Integer Primary Key AUTOINCREMENT,
        $_columnProductId Integer,
        $_columnProductName Text,
        $_columnProductPrice Integer,
        $_columnQuantity Integer,
        $_columnPhotoProduct Text,
        $_columnDescriptioOrder Text,
        $_columnSellerId Integer
      )
    ''');
  }

  Future<int> checkProduct(int? productId) async {
    GetMeatDatabases helper = GetMeatDatabases();
    Database db = await helper.database;
    if (productId == null) {
      int? count = Sqflite.firstIntValue(
          await db.rawQuery('Select Count(*) From $_tableName '));
      return count!;
    } else {
      int? count = Sqflite.firstIntValue(await db.rawQuery(
          'Select Count(*) From $_tableName Where $_columnProductId = ?',
          [productId]));
      return count!;
    }
  }
}
