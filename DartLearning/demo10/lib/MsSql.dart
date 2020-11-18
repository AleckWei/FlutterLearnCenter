import 'Db.dart';

class MsSql implements Db{

  MsSql(this.url);

  @override
  add(var data) {
    // TODO: implement add
    print('mssql的add方法 $data');
  }

  @override
  delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  save() {
    // TODO: implement save
    throw UnimplementedError();
  }

  @override
  String url;
}