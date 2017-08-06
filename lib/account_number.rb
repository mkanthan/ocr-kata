class AccountNumber

  attr_reader :status, :valid, :checksum, :number

  def initialize(number_string)
    @number = number_string
    @status = AccountStatus::ILLEGIBLE if number_string.include?(DigitMap::UNKNOWN)
    @status ||= AccountStatus::ERROR if failed_checksum
  end

  private
  def failed_checksum
    @checksum = Checksum.new(@number.to_i)
    !@checksum.valid?
  end
end