class Language {
  Language({this.title, this.iso});

  String title;
  String iso;

  @override
  String toString() {
    return title;
  }
}

class Vocabulary {
  Vocabulary({this.id, this.words, String strings});

  String id;
  List<Word> words;

  getWordInLanguage(Language language) =>
      words.firstWhere((word) => word.language.iso == language.iso);
}

class Word {
  Word(this.word, {this.language});

  String word;
  Language language;

  @override
  String toString() {
    return word;
  }
}
