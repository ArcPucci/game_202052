import 'package:shared_preferences/shared_preferences.dart';

class ConfigurationService {
  final SharedPreferences _preferences;

  ConfigurationService(this._preferences);

  static const _bankKey = "BANK";
  static const _starsKey = "STARS";
  static const _lastWonKey = "LAST_WON";
  static const _firstInitKey = "FIRST_INIT";
  static const _boughtAccessoriesKey = "BOUGHT_ACCESSORIES";
  static const _minBetKey = "MIN_BET";
  static const _musicKey = "MUSIC";
  static const _soundKey = "SOUND";
  static const _stateKey = "STATE";
  static const _reflexesKey = 'REFLEXES';
  static const _extendedReachKey = 'EXTENDED_REACH';
  static const _speedBoost = 'SPEED_BOOST';
  static const _bombHint = 'BOMB_HINT';
  static const _hintsKey = 'HINTS';

  Future<void> setBank(int bank) async {
    await _preferences.setInt(_bankKey, bank);
  }

  int getBank() {
    return _preferences.getInt(_bankKey) ?? 500;
  }

  Future<void> setStars(int stars) async {
    await _preferences.setInt(_starsKey, stars);
  }

  int getStars() {
    return _preferences.getInt(_starsKey) ?? 5000;
  }

  Future<void> setLastWon(int lastWon) async {
    await _preferences.setInt(_lastWonKey, lastWon);
  }

  int getLastWon() {
    return _preferences.getInt(_lastWonKey) ?? 0;
  }

  Future<void> setFirstInit() async {
    await _preferences.setBool(_firstInitKey, false);
  }

  bool getFirstInit() {
    return _preferences.getBool(_firstInitKey) ?? true;
  }

  Future<void> setBoughtAccessories(List<int> boughtAccessories) async {
    final map = boughtAccessories.map((e) => e.toString()).toList();
    await _preferences.setStringList(_boughtAccessoriesKey, map);
  }

  List<int> getBoughtAccessories() {
    final map = _preferences.getStringList(_boughtAccessoriesKey) ?? ['0'];
    return map.map((e) => int.parse(e)).toList();
  }

  Future<void> setMinBet(int minBet) async {
    await _preferences.setInt(_minBetKey, minBet);
  }

  int getMinBet() {
    return _preferences.getInt(_minBetKey) ?? 100;
  }

  Future<void> setMusic(bool music) async {
    await _preferences.setBool(_musicKey, music);
  }

  bool getMusic() {
    return _preferences.getBool(_musicKey) ?? true;
  }

  Future<void> setSound(bool sound) async {
    await _preferences.setBool(_soundKey, sound);
  }

  bool getSound() {
    return _preferences.getBool(_soundKey) ?? true;
  }

  Future<void> setState(int id) async {
    await _preferences.setInt(_stateKey, id);
  }

  int getState() {
    return _preferences.getInt(_stateKey) ?? 0;
  }

  Future<void> setReflexes(int reflexes) async {
    await _preferences.setInt(_reflexesKey, reflexes);
  }

  int getReflexes() {
    return _preferences.getInt(_reflexesKey) ?? 1;
  }

  Future<void> setExtendedReach(int extendedReach) async {
    await _preferences.setInt(_extendedReachKey, extendedReach);
  }

  int getExtendedReach() {
    return _preferences.getInt(_extendedReachKey) ?? 1;
  }

  Future<void> setSpeedBoost(int speedBoost) async {
    await _preferences.setInt(_speedBoost, speedBoost);
  }

  int getSpeedBoost() {
    return _preferences.getInt(_speedBoost) ?? 1;
  }

  Future<void> setBombHint() async {
    await _preferences.setBool(_bombHint, false);
  }

  bool getBombHint() {
    return _preferences.getBool(_bombHint) ?? true;
  }

  Future<void> setHints(List<bool> hints) async {
    final map = hints.map((e) => e ? '1' : '0').toList();
    await _preferences.setStringList(_hintsKey, map);
  }

  List<bool> getHints() {
    final map =
        _preferences.getStringList(_hintsKey) ?? ['1', '1', '1', '1', '1'];
    return map.map((e) => e == '1').toList();
  }
}
