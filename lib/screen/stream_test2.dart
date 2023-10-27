import 'dart:io';

import 'package:fast_app_base/common/cli_common.dart';

void main() async {
  /// List와 Iterable
  // final List list = ['blue', 'yellow', 'red'];
  // final iterator = list.iterator;
  // print(iterator.current);
  // while (iterator.moveNext()) {
  //   print(iterator.current);
  // }
  //
  // list.forEach((element) {
  //   print(element);
  // });
  //
  // for (final color in [1, 2, 3, 4, 5]) {
  //   print(color);
  // }

  /// sync*로 Iterable 만들기
  for (final message in countIterable(5)) {
    print(message);
  }

  // await for는 Stream을 받을 수 있습니다. (그냥 for는 Iterable만 가능)
  await for (final message in countStream(3)) {
    print(message);
  }

  /// async*로 Stream 만들기

  /// yield*를 통해서 Iterable & Stream 연장시키기
}

// 로컬작업
// sync*는 Iterable를 만드는 함수
// yield라는 키워드를 통해서 데이터를 생산합니다.
Iterable<String> countIterable(int max) sync* {
  for (int i = 1; i <= max; i++) {
    // sleep함수 사용하면 큰일납니다.
    // 이 함수가 동작하는 CPU Thread를 아에 멈춰버리게 됩니다.
    // Dart Flutter에서 수행하는 모든 코드들은 UI Thread라고 하는 Main Thread에서
    // 수행이 됩니다.
    // 애니메이션, UI터치 그 모든 Main Thread가 감당해야할 작업들이 멈춰버리게 됩니다.
    // 실무에서는 절대로 쓰면 안되는 함수입니다.
    // 대신에 Isolates를 사용한다면, 다른 Thread에서는 sleep함수를 사용해도 됩니다.
    // 조심하세요!
    // sleep(1.seconds);
    yield i.toString();
  }
  yield '새해복 많이 받으세요';
  // 1. yield*를 통한 에러객체 전달
  // yield* Stream.error(Exception('에러 발생'));
  // 2. 여기 있는 Iterable를 확장시키는 역할을 합니다.
  yield* ['1', '2', '3', '4'];
  // 재귀호출 가능
  // yield* countIterable(max);
  // yield* ['a', 'b', 'c'];
}

///Generator: yield(생산하다)키워드를 사용할 수 있는 Iterable과 Stream을 일컬어서 Generator라고 말합니다.
///어떠한 비슷한 데이터를 지속적으로 생산하다라는 의미입니다. (일련의 작업들을 수행)
// Future함수들 같이 수행할 경우
Stream<String> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    await sleepAsync(1.seconds);
    yield i.toString();
  }
  yield '새해복 많이 받으세요';
  // 재귀호출 가능
  yield* countStream(to);
}

Future sleepAsync(Duration duration) {
  return Future.delayed(duration, () => {});
}
