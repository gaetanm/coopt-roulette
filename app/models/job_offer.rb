class JobOffer
  include ActiveModel::Serializers::JSON

  attr_acccessor :title, :description, :salary, :internal_reference,
  :company_name, :status, :published_at, :closed_at, :created_at, :updated_at

  def attributes=(hash)
    hash.each do |key, value|
      send("#{key}=", value)
    end
  end
end