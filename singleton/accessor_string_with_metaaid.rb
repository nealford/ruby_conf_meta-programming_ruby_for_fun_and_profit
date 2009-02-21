require 'metaaid'

class Person
       
   class << metaclass
    def accessor_string(*names)
     names.each do |name|
       class_eval <<-EOF
          def #{name}
            @#{name}.to_s
          end
        EOF
     end
    end
  end

  def initizialize
    @a = [1, 2, 3]
    @b = Time.now
  end

  accessor_string :a, :b
end