module DisplayTime
  def display_created_at
    self.created_at.strftime("%b %d, %Y")
  end

  def display_updated_at
    self.updated_at.strftime("%b %d, %Y")
  end
end