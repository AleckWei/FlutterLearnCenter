main(List<String> args) {
  // sumNum(int n){
  //   var sum = 0;
  //   for(var i=1;i <= n;i++){
  //     sum += i;
  //   }
  //   return sum;
  // }

  // var result = sumNum(5);
  // print(result);

  // result = sumNum(60);
  // print(result);

  // result = sumNum(100);
  // print(result);

  // 2. 定义一个方法然后打印用户信息
  String printUserInfo(String username,int age){ 
    //函数定义时用的参数叫形参
    return "姓名：$username --- 年龄：$age";
  }
  // 如果传入的参数是可选的，就用下面这种形式
  String printUserInfo1(String name,[String sex = '男',int age]){
    if(age!=null && sex!=null){
      return "姓名：$name --- 年龄：$age --- 性别：$sex";
    }else if(age!=null && sex == null){
      return "姓名：$name --- 年龄：$age";
    }else if(age==null && sex!=null){
      return "姓名：$name --- 性别：$sex";
    }
    return '姓名：$name';
  }

  String printUserInfo2(String name, {int age,String sex = '男'}){
    // 这种写法，在传入大括号内的参数的时候，可以不按照定义的顺序去传参
    if(age!=null && sex!=null){
      return "姓名：$name --- 年龄：$age --- 性别：$sex";
    }else if(age!=null && sex == null){
      return "姓名：$name --- 年龄：$age";
    }else if(age==null && sex!=null){
      return "姓名：$name --- 性别：$sex";
    }
    return '姓名：$name';
  }

  var str = printUserInfo('wwj',18);
  print(str);

  var str2 = printUserInfo1('wwj','女');
  print(str2);

  var str3 = printUserInfo2('wwj',sex:'未知',age:18);
  print(str3);

  // 实现一个把方法当做参数的方法。
  fn1(){
    print('fn1');
  }

  fn2(fn){
    fn();
  }

  fn2(fn1);
}