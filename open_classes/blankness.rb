class String
  def blank?
    empty? || strip.empty?
  end
end