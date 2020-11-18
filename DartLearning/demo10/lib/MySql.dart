import 'Db.dart';

class MySql implements Db{

  MySql(this.url);

  @override
  add(var data) {
    // TODO: implement add
    print('mysql的add方法 $data');
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