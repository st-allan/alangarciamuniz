module Jekyll
    module ReadingTimeFilter
      def reading_time(input)
        words_per_minute = 200
        words = input.split.size
        minutes = (words / words_per_minute.to_f).ceil
        "#{minutes} min de lectura"
      end
    end
  end
  
  Liquid::Template.register_filter(Jekyll::ReadingTimeFilter)