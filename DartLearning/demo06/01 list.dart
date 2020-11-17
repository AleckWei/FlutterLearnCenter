/**
 * List 里面常用的属性和方法：
 *  常用属性：
 *    length      长度
 *    reversed    翻转
 *    isEmpty     是否为空
 *    isNotEmpty  是否不为空
 * 
 * 常用方法：
 *    add                   增加
 *    addAll                拼接数组
 *    indexOf               查找value的index 需要传入value
 *    remove                删除value 需要传入value
 *    removeAt              删除value 需要传入index
 *    fillRange             修改？
 *    insert(index,value)   指定位置插入值
 *    insertAll(index,list) 指定位置插入list
 *    toList()              其他类型转化为list
 *    join()                List转换为字符串
 *    split()               字符串转化为List
 * 
 *    forEach
 *    map
 *    where
 *    any
 */
main(List<String> args) {
  List myList = ['香蕉','苹果','西瓜','橘子'];
  myList.fillRange(1, 2,'aaa');
  print(myList);

  var joinStr = myList.join('-');
  //把list转换成字符串，并以传入的字符作为分隔符分隔开
  print(joinStr);

  var splitlist = joinStr.split('-');
  // split和join互为反操作，
  print(splitlist);
}