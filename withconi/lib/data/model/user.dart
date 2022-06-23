import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:withconi/configs/constants/enum.dart';
import 'conimal.dart';
part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class WcUser with _$WcUser {
  factory WcUser(
      {required String uid,
      required String email,
      required String displayName,
      required String nickname,
      required ProviderOptions provider,
      String? photoURL,
      required List<Conimal> conimals}) = _WcUser;

  factory WcUser.fromJson(Map<String, dynamic> json) => _$WcUserFromJson(json);
}
