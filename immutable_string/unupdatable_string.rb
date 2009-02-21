class String
  instance_methods.each do |m|
    undef_method m.to_sym if m =~ /.*!$/
  end
endte