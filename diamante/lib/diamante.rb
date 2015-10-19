# http://dojopuzzles.com/problemas/exibe/diamantes/

class Diamante
  LETTERS = ("A".."Z").to_a

  def initialize(letter)
    @letter = letter
  end

  def valid?
    string? && one_character? && valid_character?
  end

  def render
    raise ArgumentError, 'The given argument is not a single letter!' unless valid?
    return @rendered if @rendered

    previous_letters  = LETTERS[0, index_for_letter]
    external_spaces   = index_for_letter
    chars_per_line    = (external_spaces * 2) + 1
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
    render unless @rendered

    @rendered.each do |letter, internal_spaces, external_spaces|
      if internal_spaces.zero?
        internal_chars = letter
      else
        internal_chars = letter + " "*internal_spaces + letter
      end
      puts " "*external_spaces + internal_chars + " "*external_spaces
    end
  end

  private
  def index_for_letter
    LETTERS.index(@letter)
  end

  def string?
    @letter.kind_of?(String)
  end

  def valid_character?
    LETTERS.include?(@letter.upcase)
  end

  def one_character?
    @letter.length == 1
  end

end

# print all diamonds!
# ("A".."Z").to_a.each { |letter| puts Diamante.new(letter) }
