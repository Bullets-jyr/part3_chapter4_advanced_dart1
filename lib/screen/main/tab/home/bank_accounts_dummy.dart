import 'dart:collection';

import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/dart/extension/collection_extension.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';
import 'package:flutter/material.dart';

import 'banks_dummy.dart';

final bankAccountShinhan1 = BankAccount(1, bankShinhan, 300, accountTypeName: "신한 주거래 우대통장(저축예금)");
final bankAccountShinhan2 = BankAccount(2, bankShinhan, 200, accountTypeName: "저축예금");
final bankAccountShinhan3 = BankAccount(3, bankShinhan, 100, accountTypeName: "저축예금");
final bankAccountToss = BankAccount(4, bankTtoss, 400);
final bankAccountKakao = BankAccount(5, bankKakao, 70000, accountTypeName: "입출금통장");
final bankAccountKakao2 = BankAccount(6, bankKakao, 1000000, accountTypeName: "특별통장");

abstract class Animal {
  void eat();
}

class Dog extends Animal {
  void eat() {
    print('dog');
  }
}

class Cat extends Animal {
  void eat() {
    print('cat');
  }
}

class Cow extends Animal {
  void eat() {
    print('cow');
  }
}

main() {
  // 삽입
  bankAccounts.insert(1, bankAccountKakao2);

  // 위치 이동
  // final temp = bankAccounts[4];
  // bankAccounts.removeAt(4);
  final temp = bankAccounts.removeAt(4);
  bankAccounts.insert(0, temp);

  // 교환
  final temp1 = bankAccounts.last;
  bankAccounts[5] = bankAccounts[0];
  bankAccounts[0] = temp1;
  bankAccounts.swap(0, 5);

  // 변환
  final banks = bankAccounts.map((e) => e.bank).toList();
  for (final bank in banks) {
    print(bank.toString());
  }

  final banksWithIndex = bankAccounts.mapIndexed((e, index) => Row(children: [(index + 1).text.make()],)).toList();
  for (final bank in banksWithIndex) {
    print(bank.toString());
  }

  for (final account in bankAccounts) {
    print(account.toString());
  }

  final map = HashMap<String, BankAccount>();
  map["ttoss"] = bankAccountToss;
  map["kakao"] = bankAccountKakao;
  map.putIfAbsent("kakao", () => bankAccountKakao2);
  if (!map.containsKey("kakao")) {
    map["kakao"] = bankAccountKakao2;
  }

  final ttossAccount = map["ttoss"];

  final banks2 = bankAccounts.map((e) => e.bank).toList();

  final uniqueBanks = banks2.toSet();
  for (final bank in uniqueBanks) {
    print(bank.toString());
  }

  // 생성
  final list = [];

  final set = {bankAccountShinhan1, bankAccountShinhan2};
  final map2 = {"shinhan1": bankAccountShinhan1, "shinhan2": bankAccountShinhan2};

  //class generic

  final result = doTheWork();
  final result2 = doTheWork2();

  //method or function generic

  final result4 = doTheWork4<String, Dog>("String", ["dog1", "dog2"]);

  final result3 = doTheWork3<Dog>(() => Dog());
  result3.eat();
}

class Result<T> {
  final T data;

  Result(this.data);
}

class ResultString {
  final String data;

  ResultString(this.data);
}

class ResultDouble {
  final double data;

  ResultDouble(this.data);
}

Result doTheWork4<T, Result extends Animal>(T data, List<T> genericList) {
  return Cat() as Result;
}

Result doTheWork3<Result extends Animal>(Result Function() animalCreator) {
  return animalCreator();
}

Result<String> doTheWork() {
  ///...1
  ///...2
  ///
  /// ..4
  return Result("중요한 데이터");
}

ResultDouble doTheWork2() {
  ///...1
  ///...2
  ///
  /// ..4
  return ResultDouble(5234.44);
}

//List
final bankAccounts = [
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountToss,
  bankAccountKakao
];

//Map
final bankMap = {
  "shinhan1": bankAccountShinhan1,
  "shinhan2": bankAccountShinhan2,
};

//Set
final bankSet = {
  bankAccountShinhan1,
  bankAccountShinhan2,
  bankAccountShinhan2,
  bankAccountShinhan2,
  bankAccountShinhan2,
  bankAccountShinhan3,
  bankAccountToss,
  bankAccountKakao
};
