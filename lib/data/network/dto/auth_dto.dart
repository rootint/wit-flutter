import 'package:json_annotation/json_annotation.dart';

part 'auth_dto.g.dart';

@JsonSerializable(createFactory: false)
class AuthDto {
  @JsonKey(name: 'username')
  final String username;
  @JsonKey(name: 'password')
  final String password;

  AuthDto({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$AuthDtoToJson(this);
}

