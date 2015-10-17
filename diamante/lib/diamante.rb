# http://dojopuzzles.com/problemas/exibe/diamantes/

class Diamante

  LETTERS = ("A".."Z").to_a

  def initialize(letter)
    @letter = letter
  end

  def valid?
    @letter.kind_of?(String) && @letter.length == 1 && LETTERS.include?(@letter.upcase)
  end

  def render
    raise ArgumentError, 'The given argument is not a single letter!' unless valid?
    return @rendered unless @rendered.nil?

    @letter = @letter.upcase
    previous_letters = LETTERS.select { |letter| letter < @letter }
    external_spaces = previous_letters.length
    chars_per_line = external_spaces*2 + 1
    @rendered = []

    complete = previous_letters + [@letter] + previous_letters.reverse
    complete.each_with_index do |letter, index|
      number_of_letter = (index.zero? || index == complete.length-1) ? 1 : 2
      @rendered << [letter, chars_per_line - (external_spaces.abs*2 + number_of_letter), external_spaces.abs]
      external_spaces = external_spaces - 1
    end

    @rendered
  end

  def to_s
    render if @rendered.nil?
    @rendered.each do |letter, internal_spaces, external_spaces|
      if internal_spaces.zero?
        internal_chars = letter
      else
        internal_chars = letter + " "*internal_spaces + letter
      end
      puts " "*external_spaces + internal_chars + " "*external_spaces
    end
  end

end

# print all diamonds!
# ("A".."Z").to_a.each { |letter| puts Diamante.new(letter) }
