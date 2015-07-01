class Snippet < ActiveRecord::Base
  
  validates_presence_of :text
  validates :text, length: { maximum: 8192 }
  
  scope :public_snippet, -> { where(private: false) }
  
  after_create :create_access_token
  
  def create_access_token
    if self.private
      token = SecureRandom.uuid
      self.access_token = token
      self.save
    end
  end
  
    
end
