import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:fast_app_base/common/cli_common.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

void main() {
  /// Stream 기본 개념
  /// Future - 1번의 데이터를 가져옴
  /// Stream - 여러번의 데이터를 받을 수 있음

  /// Stream 생성과 수행
  /// 1. async*
  /// 2. streamController
  // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].forEach((element) {
  //   print(element);
  // });

  // countStream(4).map((event) => '$event 초가 지났습니다.').listen((event) {
  //   print(event);
  // });

  // countStream(4).transform(utf8.decoder).listen((event) {
  //   print(event);
  // });

  // final controller = StreamController<int>();
  // final stream = controller.stream;
  //
  // stream.listen((event) {
  //   print(event);
  // });
  //
  // addDataToTheSink(controller);

  /// Stream 데이터 관찰

  /// 위젯에서 Stream Data 표현하기

  /// Stream 데이터 관찰2 - BroadcastStream
  // final broadCastStream = countStream(4).asBroadcastStream();
  // broadCastStream.listen((event) {
  //   print(event);
  // });
  //
  // Future.delayed(2.seconds, () {
  //   broadCastStream.listen((event) {
  //     print('방송 2초 후: $event');
  //   });
  // });

  /// 2개의 위젯에서 하나의 BroadcastSteam Data 표현하기

  /// Stream Error Handling
  // countStream(5).listen((event) {
  //   print(event);
  // }, cancelOnError: false).onError((e, trace) {
  //   print(e.toString());
  // });
  // 미리 에러 처리에 대한 정의를 할 수 있습니다.
  countStream(5).handleError((e) {
    print(e.toString());
  }).listen((event) {
    print(event);
  }, cancelOnError: false);
}

void addDataToTheSink(StreamController<int> controller) async {
  for (int i = 1; i <= 4; i++) {
    // print('before add sink');
    // controller.sink.add(i);
    // print('after add sink');
    await sleepAsync(1.seconds);
    controller.sink.add(i);
  }
}

Stream<int> countStream(int max) async* {
// Stream<List<int>> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    if (i == 2) {
      // throw Exception('에러 발생');
      yield* Stream.error(Exception('에러 발생'));
    } else {
      yield i;
    }
    // print('before yield');
    // 생산하다
    // yield i;
    // yield [2, 4, 4, 2];
    await sleepAsync(1.seconds);
    // print('before yield');
  }
}
