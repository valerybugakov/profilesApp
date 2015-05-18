class User < ActiveRecord::Base

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, styles: { large: "1024x1024>", medium: "300x300>", thumb: "50x50" }
   validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  def active_for_authentication?
    super && !banned?
  end

end
