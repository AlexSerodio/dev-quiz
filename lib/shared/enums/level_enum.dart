enum Level { facil, medio, dificil, perito }

extension LevelStringExt on String {
  Level get levelParse => {
    "facil" : Level.facil,
    "medio" : Level.medio,
    "dificil" : Level.dificil,
    "perito" : Level.perito, 
  }[this]!;
}

extension LevelExt on Level {
  String get parse => {
    Level.facil : "facil",
    Level.medio : "medio",
    Level.dificil : "dificil",
    Level.perito : "perito", 
  }[this]!;

  String get label => {
    Level.facil : "Fácil",
    Level.medio : "Médio",
    Level.dificil : "Difícil",
    Level.perito : "Perito", 
  }[this]!;
}

