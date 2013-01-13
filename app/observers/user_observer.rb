class UserObserver < Mongoid::Observer

  def before_create(resource)
    resource.remember_value    
  end
end
