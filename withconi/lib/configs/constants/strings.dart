class Strings {
  Strings._();
  static Validator validator = const Validator();
}

class Validator {
  const Validator();
  String get email => '올바른 이메일 형식으로 입력해주세요';
  String get password => '8자리 이상 영문과 숫자 혹은 기호 조합';
  String get confirmPassword => '비밀번호가 다릅니다';
  String get name => '1~8자 이내';
}
