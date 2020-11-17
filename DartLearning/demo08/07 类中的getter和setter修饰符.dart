class Rect {
  num height;
  num width;

  Rect(this.height,this.width);
  area(){
    return this.height * this.width;
  }
}

class Rect2 {
  num height;
  num width;

  Rect2(this.height,this.width);

  get area{
    return this.height * this.width;
  }// 有点像vue的计算属性

  set areaHight(value){
    this.height = value;
  }

}

main(List<String> args) {
  Rect r = Rect(10,4);
  print('r1的面积: ${r.area()}');

  Rect2 r2 = Rect2(20, 3);
  print('r2的面积: ${r2.area}');

  r2.areaHight = 6;
  print('r2更改后的面积: ${r2.area}');

}