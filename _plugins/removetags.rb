module RemovetagsFilter
  def removetags(input)
    return input.gsub(/<[^>]*>/, "")
  end

  Liquid::Template.register_filter self
end

