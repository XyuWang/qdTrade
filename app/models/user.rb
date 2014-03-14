class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :posts
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
