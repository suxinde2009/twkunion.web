class UserObserver < Mongoid::Observer

  def before_create(resource)
    resource.remember_value    
  end

  def around_validation(resource)
    p resource.errors.full_messages    
  end
end
