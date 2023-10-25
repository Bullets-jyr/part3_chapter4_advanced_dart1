import 'dart:async';

import 'package:fast_app_base/common/cli_common.dart';
import 'package:fast_app_base/screen/main/tab/home/bank_accounts_dummy.dart';
import 'package:fast_app_base/screen/main/tab/home/vo/vo_bank_account.dart';

void main() async {
  // Future의 기본 개념
  /// Future == 미래
  /// 시간이 걸리는 Computation 작업 또는 유저의 응답을 기다려야되는 상태

  // Future의 생성과 수행
  // print('Start');
  // final account = await getBankAccounts();
  // getBankAccounts().then((value) {
  //   print(value.toString());
  // });
  // print(account.toString());
  // print('End');

  // Future Timeout
  // print('Start');
  // final result = await getBankAccounts().timeout(1.seconds).onError((error, stackTrace) => []);
  // print(result);
  // print('End');
  
  // Future Error handling
  print('Start');
  try {
    final result = await getBankAccounts().timeout(1.seconds);
    print(result);
    // try - catch에서는 .then을 사용하지마세요.
    // 대신에 .catchError()함수를 사용하세요
    // getBankAccounts().then((value) {
    //   print(value.toString());
    // }).catchError((error, stackTrace) {
    //   print(error);
    //   print(stackTrace);
    // });
  } catch(e) {
    print(e);
  }
  print('End');

  // FutureOr
  // Future이거나 아니거나

}

abstract class DoWorkInterface {
  FutureOr doWork();
  // String doWork();
}

class SyncWork extends DoWorkInterface {
  @override
  String doWork() {
    // TODO: implement doWork
    // throw UnimplementedError();
    return "wow";
  }
}

class AsyncWork extends DoWorkInterface {
  @override
  Future<String> doWork() async {
    // TODO: implement doWork
    // throw UnimplementedError();
    return "";
  }
}

Future<List<BankAccount>?> getBankAccounts() async {
  await sleepAsync(2.seconds);
  return bankAccounts;
}

Future sleepAsync(Duration duration) {
  return Future.delayed(duration, () => {});
}