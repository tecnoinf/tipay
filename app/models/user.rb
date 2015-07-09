class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  has_many :notices, dependent: :destroy
  
  before_save :set_admin
  
  
  def full_name
    if self.name.blank?
      self.email
    else
      self.name
    end
  end
  
  #def active_for_authentication? 
  #  super && approved? 
  #end 

  #def inactive_message 
  #  if !approved? 
  #    :not_approved 
  #  else 
  #    super # Use whatever other message 
  #  end 
  #end
  
  
  private
  def set_admin
    if User.count < 2
      self.role = 1
      #self.approved=true
    end
  end
  

end
