class Animal {
  String _name;
  int age;

  Animal(this._name,this.age);

  void printInfo(){
    print('$_name --- $age');
  }

  String getName(){
    return this._name;
  }

  void _run(){
    print('跑呀！！！！！！');
  }

  void execRun(){
    this._run();
    // 创建一个公有的方法去访问一个私有的方法
    // 也是ok的。
    
  }
}