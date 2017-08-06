class Checksum
  attr_reader :product, :result

  def initialize(account_num_integer)
    @number = account_num_integer
    @product = calculate_product
    @result = @product % 11
  end

  def valid
    @result == 0
  end

  private

  def calculate_product
    reversed_number.each_with_index.inject(0) { |sum, (dx,pos)| sum + (pos + 1) * dx }
  end

  def reversed_number
    @number.to_s.split('').map { |digit| digit.to_i }.reverse
  end
end