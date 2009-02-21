class Photographer
   def shoot
     puts "smile!"
   end
end   

class Gangster
   def shoot
     puts "OK, you're dead!"
   end
end

class Hacker
end

dmv_line = []
dmv_line << Photographer.new
dmv_line << Gangster.new
dmv_line << Hacker.new

dmv_line.each do |p|
    p.shoot if p.respond_to? :shoot
end