class JobOffer
  include ActiveModel::Model

  attr_accessor :id, :title, :description, :salary, :internal_reference,
  :company_name, :status, :published_at, :closed_at, :created_at, :updated_at
  
  def self.find(id)
    get_json_data.each do |v|
      return self.new v if v['id'] == id
    end
    return nil
  end

  def self.count
    get_json_data.length
  end

  def initialize(attributes={})
    super
  end

  private
  def self.get_json_data
    data = File.read(Rails.root + 'test/fixtures/job_offers.json')
    JSON.parse(data)
  end
end