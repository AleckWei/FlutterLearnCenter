main(List<String> args) {
  List myList = ['香蕉','苹果','菠萝'];

  for(var i=0;i<myList.length;i++){
    print(myList[i]);
  }

  for(var item in myList){
    print(item);
  }

  myList.forEach((value) { 
    print("$value");
  });

  List myList1 = [1,3,5];
  List newList = new List();
  for(var i=0;i<myList1.length;i++){
    newList.add(myList1[i] * 2);
  }
  print(newList);

  List myList2 = [2,4,8];
  var newList1 = myList2.map((e) => e*2);
  print(newList1.toList());

  List myList3 = [11,45,80];
  var newList2 = myList3.where((element) => element > 50);
  print(newList2.toList());

  List myList4 = [1,2,3,4,5,6,7,8,9,10];
  var anyList = myList4.any((element) => element > 10);
  // 只要集合里面有满足条件的，就返回true
  print(anyList);

  var everyList = myList4.every((element) => element < 10);
  // 集合里所有的元素都满足条件的，才返回true
  print(everyList);

  var setNew = new Set();
  setNew.addAll([1,22,333,4444,55555]);
  setNew.forEach((element) {print(element);});

  var person = {
    "name" : "wwj",
    "age" : 20
  };

  person.forEach((key, value) {
    print("$key -- $value");
  });
}