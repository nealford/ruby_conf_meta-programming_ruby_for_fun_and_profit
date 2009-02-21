require File.dirname(__FILE__) + '/../functional_test_helper'

functional_tests do
  
  test "uniqueness of keys" do
    language_files = Dir[File.join(RAILS_ROOT, 'lang', '**', '*.yml')]
    language_files.each do |file|
      pairs = {}
      
      File.readlines(file).each_with_index do |line,number|
        number += 1
        
        next unless line =~ /(.*?):(.*)/
        if pairs.key?($1)
          flunk "Duplicate key in #{file}: #{$1} (values: #{pairs[$1][:value]} (line: #{pairs[$1][:line]}), #{$2} (line: #{number})"
        end
        pairs[$1] = {:value => $2, :line => number}
      end
    end
  end
end
