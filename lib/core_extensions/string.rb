class String
  def to_snakecase
    self.scan(/[A-Z][a-z]*/).join('_').downcase
  end

  def to_camelcase
    self.split('_').map(&:capitalize).join
  end
end