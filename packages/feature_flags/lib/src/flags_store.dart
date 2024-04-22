import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/rxdart.dart';

class FlagsStore {
  final String sharedPreferencesKey;
  SharedPreferences? _prefs;
  List<String> _flags = const [];
  final BehaviorSubject<List<String>> _controller = BehaviorSubject<List<String>>.seeded(const []);
  ValueStream<List<String>> get stream => _controller.stream;

  static FlagsStore? _instance;

  factory FlagsStore.getInstance() => _instance ??= FlagsStore();

  bool isFeatureEnabled(String id) => stream.value.contains(id);

  FlagsStore({
    this.sharedPreferencesKey = 'feature_flags',
  });

  Future<void> load() async {
    _prefs ??= await SharedPreferences.getInstance();
    final flags_ = _prefs!.get(sharedPreferencesKey);
    if (flags_ != null) {
      _flags = '$flags_'.split(',').where((x) => x.isNotEmpty).toList();
      _controller.add(_flags);
    }
  }

  Future<void> setFlag(String id, bool isEnabled) async {
    final newFlags = [
      ..._flags.where((flag) => flag != id),
      if (isEnabled) id,
    ];

    _flags = newFlags;
    _controller.add(_flags);

    if (_prefs != null) {
      await _prefs!.setString(
        sharedPreferencesKey,
        _flags.join(','),
      );
    }
  }

  Future<void> reset() async {
    _flags = [];
    _controller.add(_flags);

    if (_prefs != null) {
      await _prefs!.remove(sharedPreferencesKey);
    }
  }

  Future<void> close() async {
    await _controller.close();
  }
}
