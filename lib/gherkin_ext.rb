#This file extends the gherkin lang. to allow loading data from CSV file in feature examples

require 'gherkin/lexer/i18n_lexer'

class GherkinExt

  def self.enable_external_source data_reader
    lexer = Gherkin::Lexer::I18nLexer

    lexer.class_eval do
      @data_reader = data_reader # class instance variable

      def self.data_reader # access to class instance variable
        @data_reader
      end

      alias_method :old_scan, :scan

      def scan(source)
        old_scan self.class.modify_source(source)
      rescue Exception => e
        unless e.kind_of? Gherkin::Parser::ParseError
          puts "Error while parsing gherkin file:"
          puts "  Error: #{e.message}"
          puts "  Caller: #{caller}"
          puts "  Content: #{source}"
        end
      end

      private

      def self.modify_source source
        if check_file_tag(source)
          new_source = ""

          source.each_line do |line|
            if check_file_tag(line) and line.strip[0] != "#"
              part1, part2 = line.split(",")

              source_path = part1.gsub('file:', '').gsub('|', '').strip
              key = part2 ? part2.gsub('key:', '').gsub('|', '').strip : nil

              if source_path
                values = self.data_reader.call(source_path)

                data = key.nil? ? values : values[key]

                if data && data.size > 0
                  new_source += build_data_section data
                else
                  puts "Cannot find source for #{key}."

                  new_source += line
                end
              end
            else
              new_source += line
            end

            new_source += "\n"
          end

          new_source
        else
          source
        end
      end

      def self.check_file_tag text
        encoded_text = text.encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')

        encoded_text =~ /file\s?:/
      end

      def self.build_data_section rows, build_titles=true
        buffer = ""

        if build_titles and rows.first.kind_of?(Hash)
          buffer += "  |"

          rows.first.each do |element|
            buffer += " #{element[0]} |"
          end

          buffer += "\n"
        end

        rows.each do |row|
          buffer += "  |"

          row.each do |element|
            if element.kind_of? Array
              buffer += " #{element[1]} |"
            else
              buffer += " #{element} |"
            end
          end

          buffer += "\n"
        end

        buffer
      end
    end
  end

end
