class AccountNumberTransformer
  attr_reader :account_number

  def initialize(digit_horizontal_slices)
    @horizontal_slices = digit_horizontal_slices
  end

  def transform
    digitize_and_convert
  end

  private

  def digitize_and_convert
    number = ""
    digit_slices.first.each_with_index do |slice, index|
      horizontal_digit = slice + digit_slices[1][index] + digit_slices[2][index]
      number += DigitConverter.new(horizontal_digit).character
    end

    @account_number = AccountNumber.new(number)
  end

  def digit_slices
    @horizontal_slices.map do |horizontal_slice|
      horizontal_slice.scan(/.{3}/)
    end
  end

end