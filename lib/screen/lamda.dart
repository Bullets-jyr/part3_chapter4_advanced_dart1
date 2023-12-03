import 'package:fast_app_base/common/dart/collection/sort_functions.dart';

class Animal {
  // final add2 = (int a, int b) => a + b;

  // void eat() {}
  int age;
  final String name;

  // Animal(this.age);
  Animal(this.age, this.name);

  void eat() {
    age++;
  }

  // error
  // final eat2 = () => age++;
  final eat2 = () {
    //   age++; // error
  };

  // @override
  // String toString() {
  //   return "Animal: $age";
  // }
  @override
  String toString() {
    return "Animal: $age, $name";
  }
}

main() {
  /// 람다의 표현 설명
  ///
  /// (int 파라미터1, String 파라미터2) => 반환값
  int add(int a, int b) {
    return a + b;
  }
  // (int a, int b) => a + b;

  // int add(int a, int b) => a + b;

  final add2 = (int a, int b) => a + b;
  final add3 = add2;
  print(add2 == add3);

  run(add2, 1, 3);

  // final animal = Animal();
  // final addFunction = animal.add2;
  //
  // int add(int a, int b) {
  //   a;
  //   b;
  //   a;
  //   b;
  //   a;
  //
  //   return a+b;
  // }
  //
  // final add2 = (int a, int b) => a + b;
  //
  // run(add2, 1, 3);

  // final animal = Animal();
  // final addFunction = animal.add2;

  /// 람다의 특징 설명

  /// 1. 익명: 이름을 지을 수 없다. (변수에 담을 수 있음)
  /// final add2 = add3(int a, int b) => a + b; >>> 불가능
  /// 2. 람다(함수): Class에 종속되지 않음
  /// cf) 메서드: Class에 종속되어 있음
  /// 3. 전달: 1급 객체로서 함수 파라미터로 전달, 변수에 저장 가능
  /// 4. 간결성: 익명 클래스처럼 많은 코드를 구현할 필요가 없다.

  /// List Sort 예제

  // final list = [5, 2, 4, 1, 3];
  // list.sort(); // default: 오름차순
  // print(list);
  // list.sort((a, b) => a == b
  //     ? 0
  //     : a > b
  //         ? 1 // 양수
  //         : -1 // 음수
  // );
  // print(list);

  // final listAnimal = [Animal(5), Animal(3), Animal(2), Animal(6), Animal(20)];
  // listAnimal.sort(byIntField<Animal>((element) => element.age, reverse: true));
  // print(listAnimal);

  final list = [
    Animal(5, '강아지'),
    Animal(3, '치타'),
    Animal(2, '토끼'),
    Animal(6, '하마'),
    Animal(20, '펭귄'),
  ];
  list.sort(byStringField<Animal>((element) => element.name, reverse: true));
  print(list);

  // final add2 = add(2);
  // //print(add2(3));
  // print(add(2)(3));
}

void run(int Function(int a, int b) add2, int a, int b) {
  final sum = add2(a, b);
  print(sum);
}

void runOperation(int Function(int a, int b) add2, int a, int b) {
  final sum = add2(a, b);
  print(sum);
}

final add = (a) => (b) => a + b;
