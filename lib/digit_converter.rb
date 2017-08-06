class DigitConverter

  attr_reader :number, :character

  def initialize(digit_string)
    @digit = digit_string
    @number = map_digit[@digit] || nil
    @character = @number ? number.to_s : "?"
  end

  private

  def map_digit
    {
      DigitMap::ZERO => 0,
      DigitMap::ONE => 1,
      DigitMap::TWO => 2,
      DigitMap::THREE => 3,
      DigitMap::FOUR => 4,
      DigitMap::FIVE => 5,
      DigitMap::SIX => 6,
      DigitMap::SEVEN => 7,
      DigitMap::EIGHT => 8,
      DigitMap::NINE => 9
    }
  end
end