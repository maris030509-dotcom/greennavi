class User < ApplicationRecord
  # Include default devise modules. Others available a
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  belongs_to :prefecture, optional: true
<<<<<<< HEAD

  def active_for_authentication?
    super && is_active?
  end

  def inactive_message
    is_active? ? super : :inactive_account
  end

=======
  
>>>>>>> origin/main
  validates :name, presence: true
  validates :prefecture_id, presence: true
end
