module IndexHelper
  def resource_name
    :renter
  end

  def resource
    @resource ||= Renter.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:renter]
  end
end
