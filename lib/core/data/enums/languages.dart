
enum Languages {
  ar,
  en
}

extension LanguagesExt on Languages {
  String get key => toString().split('.').last;

  String get label {
    switch (this) {
      case Languages.ar:
        return 'عربي';
      case Languages.en:
        return 'English';
    }
  }

  static Languages fromString(String value) {
    return Languages.values.firstWhere(
          (e) => e.key == value,
      orElse: () => Languages.ar,
    );
  }
}
