class Customer
  def update
    save
  end
end

class Customer
  alias :old_update, :update
  def update
    Log.instance.write("Saving")
    old_save
  end
end

class Customer
  old_update = self.instance_method(:update)
  def save
     Log.instance.write("Saving")
     old_update.bind(self).call
  end
end