class Animal {
  String _name; // 私有属性
  int age;
  Animal(this._name,this.age);

  void printInfo(){
    print('${this._name} -- ${this.age}');
  }

  String getName(){
    return this._name;
  }

  void _run(){
    print('私有方法run!');
  }

  execRun(){
    this._run(); //类里面的方法相互调用
  }
}
