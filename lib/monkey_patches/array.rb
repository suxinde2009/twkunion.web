class Array
  def for_auto_suggest
    collect { |x| [x.name, x.id] }
  end

  def for_auto_join
    join(',')
  end
end
