class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :categories, dependent: :destroy
  has_many :goals, through: :categories

  validates :first_name, presence: true
  validates :last_name, presence: true

  enum role: { normal_user: 0, admin: 1 }
  def full_name
    "#{first_name} #{last_name}"
  end
end
