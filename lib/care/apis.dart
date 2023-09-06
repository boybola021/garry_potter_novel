sealed class Apis {
  static const String baseUrl = "api.potterdb.com";

  static const String apiBooks = "/v1/books";
  static const String apiCharacters = "/v1/characters";
  static const String apiMovies = "/v1/movies";
  static const String apiPotions = "/v1/potions";
  static const String apiSpells = "/v1/spells";

  static const Map<String, String> headers = {
    "Content-Type": "application/json",
  };
}
