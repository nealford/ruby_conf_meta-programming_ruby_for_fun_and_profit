class CommandWrapper
  def method_missing(method, *args)
    system(method.to_s, *args)
  end
end