module HomeHelper
  def is_exists_comedian(user_id)
    res = Comedian.where(user_id: user_id)
    res.any?
  end

  def get_comedian_id(user_id)
    res = Comedian.where(user_id: user_id).first
    res.id
  end
end
