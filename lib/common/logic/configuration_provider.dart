import 'package:flutter/material.dart';
import 'package:game_202052/features/features.dart';
import 'package:just_audio/just_audio.dart';

import '../service/configuration_service.dart';

class ConfigurationProvider extends ChangeNotifier {
  final ConfigurationService _configurationService;

  ConfigurationProvider(this._configurationService) {
    init();
  }

  int _bank = 0;

  int get bank => _bank;

  int _stars = 0;

  int get stars => _stars;

  int _lastWon = 0;

  int get lastWon => _lastWon;

  bool _sound = true;

  bool get sound => _sound;

  bool _music = true;

  bool get music => _music;

  List<int> _boughtAccessories = [0];

  List<int> get boughtAccessories => _boughtAccessories;

  int _minBet = 100;

  int get minBet => _minBet;

  int _state = 0;

  int get state => _state;

  int _reflexes = 1;

  int get reflexes => _reflexes;

  int _extendedReach = 1;

  int get extendedReach => _extendedReach;

  int _speedBoost = 1;

  int get speedBoost => _speedBoost;

  static const _step = 100;

  final AudioPlayer _player = AudioPlayer();

  List<bool> _hints = [true, true, true, true, true];

  List<bool> get hints => _hints;

  Future<void> _playMusic() async {
    try {
      await _player.setAsset('assets/audio/big_band.mp3');
      await _player.play();
      _player.setLoopMode(LoopMode.all);
    } catch (e) {
      print(e);
    }
  }

  void init() async {
    _boughtAccessories = _configurationService.getBoughtAccessories();
    _minBet = _configurationService.getMinBet();
    _bank = _configurationService.getBank();
    _stars = _configurationService.getStars();
    _lastWon = _configurationService.getLastWon();
    _sound = _configurationService.getSound();
    _music = _configurationService.getMusic();
    _state = _configurationService.getState();
    _reflexes = _configurationService.getReflexes();
    _extendedReach = _configurationService.getExtendedReach();
    _speedBoost = _configurationService.getSpeedBoost();
    _hints = _configurationService.getHints();
    if (_music) await _playMusic();
  }

  void addBank(int bank) async {
    _bank += bank;
    await _configurationService.setBank(_bank);
    notifyListeners();
  }

  void addStars(int stars) async {
    _stars += stars;
    if (_stars < 0) _stars = 0;
    await _configurationService.setStars(_stars);
    notifyListeners();
  }

  void setLastWon(int lastWon) async {
    _lastWon = lastWon;
    await _configurationService.setLastWon(_lastWon);
    notifyListeners();
  }

  void increaseMinBet() async {
    if (_minBet >= 1000) return;
    _minBet += _step;
    await _configurationService.setMinBet(_minBet);
    notifyListeners();
  }

  void decreaseMinBet() async {
    if (_minBet <= _step) return;
    _minBet -= _step;
    await _configurationService.setMinBet(_minBet);
    notifyListeners();
  }

  void toggleMusic(bool value) async {
    if (_music == value) return;
    _music = value;
    await _configurationService.setMusic(_music);
    notifyListeners();
    if (_music) await _playMusic();
    if (!_music) await _player.stop();
  }

  void toggleSound(bool value) async {
    _sound = value;
    await _configurationService.setSound(_sound);
    notifyListeners();
  }

  Future<bool> setState(Skin skin) async {
    if (_state == skin.id) return false;
    if (_boughtAccessories.contains(skin.id)) {
      _state = skin.id;
      await _configurationService.setState(_state);
    } else {
      if (_bank < skin.price) return false;
      _bank -= skin.price;
      _boughtAccessories.add(skin.id);
      _state = skin.id;
      await _configurationService.setBank(_bank);
      await _configurationService.setBoughtAccessories(_boughtAccessories);
    }
    return true;
  }

  void buySkill(int id) async {
    switch (id) {
      case 0:
        if (_stars < 5000) return;
        _reflexes++;
        _stars -= 5000;
        await _configurationService.setStars(_stars);
        await _configurationService.setReflexes(_reflexes);
        break;
      case 1:
        if (_stars < 10000) return;
        _extendedReach++;
        _stars -= 10000;
        await _configurationService.setStars(_stars);
        await _configurationService.setExtendedReach(_extendedReach);
        break;
      case 2:
        if (_stars < 10000) return;
        _speedBoost++;
        _stars -= 10000;
        await _configurationService.setStars(_stars);
        await _configurationService.setSpeedBoost(_speedBoost);
        break;
    }

    notifyListeners();
  }

  void useSkill(int id) async {
    switch (id) {
      case 0:
        if (_reflexes <= 0) return;
        _reflexes--;
        await _configurationService.setReflexes(_reflexes);
        break;
      case 1:
        if (_extendedReach <= 0) return;
        _extendedReach--;
        await _configurationService.setExtendedReach(_extendedReach);
        break;
      case 2:
        if (_speedBoost <= 0) return;
        _speedBoost--;
        await _configurationService.setSpeedBoost(_speedBoost);
        break;
    }

    notifyListeners();
  }

  void completeHints(int id) async {
    _hints[id] = false;
    await _configurationService.setHints(_hints);
    notifyListeners();
  }
}
