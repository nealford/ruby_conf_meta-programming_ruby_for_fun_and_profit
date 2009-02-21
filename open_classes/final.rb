module Final
  def self.included(c)
    c.instance_eval do
      def inherited(sub)
        raise Exception, 
            "Attempt to create subclass #{sub} "
            "of Final class #{self}"
      end
    end
  end
end          

