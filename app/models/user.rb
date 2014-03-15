class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
  
  has_attached_file :avatar, :styles => { :medium => "75x75>", :thumb => "48x48>" }, :default_url => "/assets/:style/avatar.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  validates :nickname, presence: true, uniqueness: true
  validate :check_renren_url



  private

  def check_renren_url
    return true if renren_url.nil? 
    
    !!URI.parse(renren_url) && renren_url.include?("renren")
  rescue URI::InvalidURIError
    errors[:base] << "请输入正确的人人链接"
    false
  end
end
