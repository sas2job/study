module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        # Посчитать средний рейтинг фильмов по версии кинопоиска у которых две или больше стран
        # Фильмы у которых рейтиг не задан или равен 0 не учитывать в расчете среднего.
        films = array.select { |film| !film['country'].nil? && film['country'].split(',').count >= 2 && film['rating_kinopoisk'].to_f.positive? }
        average_rating = films.reduce(0) { |sum, film| sum + film['rating_kinopoisk'].to_f } / films.count
        average_rating
      end

      def chars_count(films, threshold)
        # Посчитать количество букв 'и' в названиях всех фильмов с рейтингом кинопоиска больше или равным заданному значению.
        filtered_films = films.select { |film| film['rating_kinopoisk'].to_f >= threshold }
        filtered_films.reduce(0) { |sum, film| sum + film['name'].count('и') }
      end
    end
  end
end
