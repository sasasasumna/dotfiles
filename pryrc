begin
  require 'jazz_fingers'
  JazzFingers.setup!
rescue LoadError => e
  raise unless e.message =~ /.*such file.*jazz_fingers/
puts 'no Jazz Fingers'  
end

