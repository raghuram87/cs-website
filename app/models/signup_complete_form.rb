class SignupCompleteForm
  include ActiveModel::Validations
  include ActiveModel::Conversion
  
  attr_accessor :email, :name, :username, :provider, :provider_username, :terms_of_service
  validates_presence_of :email, :username, :provider, :provider_username
  validates_acceptance_of :terms_of_service
  validates_format_of :email, :with => /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}\z/
  
  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
  
  def persisted?
    false
  end
  
end