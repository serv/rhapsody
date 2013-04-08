class String
  def limit_offset!(limit, offset)
    self.gsub!(/[\?]/, '?' => "?limit=#{limit}&") if limit
    self.gsub!(/[\?]/, '?' => "?offset=#{offset}&") if offset
    self
  end
end
