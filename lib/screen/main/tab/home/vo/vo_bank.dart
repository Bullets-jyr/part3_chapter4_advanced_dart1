import 'package:freezed_annotation/freezed_annotation.dart';

part 'vo_bank.freezed.dart';

@freezed
class Bank with _$Bank {
  factory Bank(
    final String name,
    final String logoImagePath,
  ) = _Bank;
}

// class Bank {
//   final String name;
//   final String logoImagePath;
//
//   Bank(this.name, this.logoImagePath);
//
//   @override
//   String toString() {
//     return name;
//   }
//
//   @override
//   bool operator ==(Object other) {
//     if (identical(this, other)) {
//       return true;
//     }
//     if (other.runtimeType != runtimeType) {
//       return false;
//     }
//     return other is Bank && other.name == name;
//   }
// }
