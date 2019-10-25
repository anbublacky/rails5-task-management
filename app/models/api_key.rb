class ApiKey < ActiveRecord::Base
  belongs_to :keyable, polymorphic: true
  before_create :generate_access_token
  before_create :set_expiration

  scope :valid, -> {where("expires_at > ?", DateTime.now)}
  
  def expired?
    DateTime.now >= expires_at
  end

  def live?
  	DateTime.now < expires_at
  end

  private
  def generate_access_token
    begin
      self.access_token = SecureRandom.hex
    end while self.class.exists?(access_token: access_token)
  end

  def set_expiration
    self.expires_at = DateTime.now+30
  end
end
