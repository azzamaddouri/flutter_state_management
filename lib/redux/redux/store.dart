class AppState {
  final String km;
  final String miles;

  AppState({
    required this.km,
    required this.miles,
  });

  AppState copyWith({
    String? km,
    String? miles,
  }) {
    return AppState(
      km: km ?? this.km,
      miles: miles ?? this.miles,
    );
  }

  // Initial state
  factory AppState.initial() {
    return AppState(km: '0', miles: '0');
  }
}
