class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :tasklist

  after_create :send_admin_mail
  def send_admin_mail
    NewUserEmailMailer.verify_user(self).deliver_now
  end

end
