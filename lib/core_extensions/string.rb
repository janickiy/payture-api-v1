class String
  def to_snakecase
    self.scan(/[A-Z][a-z]*/).join('_').downcase
  end

  def to_camelcase(mappings=[])
    retval = self.split('_').map(&:capitalize).join
    mappings.each {|k,v| retval.sub!(k,v)}
    retval
  end
end