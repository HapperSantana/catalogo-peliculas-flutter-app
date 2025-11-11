class Peliculas {
  String? title;
  String? year;
  String? runtime;
  String? poster;

  Peliculas({
    this.title,
    this.year,
    this.runtime,
    this.poster,
  });

  factory Peliculas.fromJson(Map<String, dynamic> json) {
    return Peliculas(
      title: json['Title'],
      year: json['Year'],
      runtime: json['Runtime'],
      poster: json['Poster'],
    );
  }

  // "Title": "The Lion King",
  // "Year": "2019",
  // "Runtime": "118 min",
  // "Poster": "https://m.media-amazon.com/images/M/MV5BMjIwMjE1Nzc4NV5BMl5BanBnXkFtZTgwNDg4OTA1NzM@._V1_SX300.jpg"
}
