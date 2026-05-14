import 'dart:math';

class UtilUuid {
  static String generateRandomId() {
    const chars = 'abcdefghijklmnopqrstuvwxyz0123456789_';
    final rand = Random.secure();
    final r =
        List.generate(4, (index) => chars[rand.nextInt(chars.length)]).join();

    final time = DateTime.now()
        .millisecondsSinceEpoch
        .toRadixString(36); // base-36 timestamp

    return (r + time);
  }
}
