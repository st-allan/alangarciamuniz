module Jekyll
    module SpanishDateFilter
      MONTHS = {
        1 => 'enero', 2 => 'febrero', 3 => 'marzo', 4 => 'abril',
        5 => 'mayo', 6 => 'junio', 7 => 'julio', 8 => 'agosto',
        9 => 'septiembre', 10 => 'octubre', 11 => 'noviembre', 12 => 'diciembre'
      }
  
      def spanish_date(date)
        day = date.strftime("%-d")
        month = MONTHS[date.strftime("%-m").to_i]
        year = date.strftime("%Y")
        "#{month} #{day}, #{year}"
      end
    end
  end
  
  Liquid::Template.register_filter(Jekyll::SpanishDateFilter)