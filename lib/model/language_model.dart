class LanguageModel {
  String language;
  String code;
  LanguageModel({required this.language, required this.code});

  static List<LanguageModel> languages = [
    LanguageModel(language: 'Arabic', code: 'ar'),
    LanguageModel(language: 'English', code: 'en'),
  ];
}
