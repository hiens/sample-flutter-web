class Configs {
  // Implement singleton
  Configs._internal();
  static final Configs _instance = Configs._internal();
  static Configs get instance => _instance;

  late String baseApiHost;

  void init({
    required String baseApiHost,
  }) {
    this.baseApiHost = baseApiHost;
  }
}
