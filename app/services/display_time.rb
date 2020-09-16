module DisplayTime
  def display_created_at
    created_at.strftime('%b %d, %Y')
  end

  def display_updated_at
    updated_at.strftime('%b %d, %Y')
  end
end
