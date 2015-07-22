class Recommendation
  include ActiveModel::Model
  include ActiveModel::Validations

  attr_accessor :male, :first_name, :last_name, :email, :phone,
  :company, :job_title, :linkedin_url, :job_offer_id, :created_at, :updated_at

  validates :first_name, presence: true
  validates :last_name, presence: true

  validates :phone, presence: true, unless: ->(recommendation){recommendation.email.present? or recommendation.linkedin_url.present?}
  validates :email, presence: true, unless: ->(recommendation){recommendation.phone.present? or recommendation.linkedin_url.present?}
  validates :linkedin_url, presence: true, unless: ->(recommendation){recommendation.email.present? or recommendation.phone.present?}

  def initialize(attributes={})
    super
    # Maybe better to add this stuff to a method like before_save...
    self.male = true if self.male == nil or self.male == 'true'
    self.male = false if self.male == 'false'
  end
end