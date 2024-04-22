extension AsExtension on Object? {
  T? asOrNull<T>() => this is T ? this as T : null;
}
