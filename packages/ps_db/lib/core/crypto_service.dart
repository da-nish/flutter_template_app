// ignore: depend_on_referenced_packages
import 'package:encrypt/encrypt.dart' as cryp;

abstract class CryptoService {
  String encrypt(String value);
  String decrypt(String value);
}

class AESCryptoService implements CryptoService {
  late final cryp.Encrypter _encrypter;
  late final cryp.IV _iv;

  AESCryptoService() {
    final key = cryp.Key.fromLength(32);
    _iv = cryp.IV.fromLength(16);
    _encrypter = cryp.Encrypter(cryp.AES(key));
  }

  @override
  String encrypt(String value) {
    return _encrypter.encrypt(value, iv: _iv).base64;
  }

  @override
  String decrypt(String value) {
    return _encrypter.decrypt64(value, iv: _iv);
  }
}