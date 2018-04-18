class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :categories, dependent: :destroy
  has_many :goals, through: :categories

  validates :first_name, presence: true
  validates :last_name, presence: true

  enum role: { user: 0, admin: 1 }
  def full_name
    "#{first_name} #{last_name}"
  end

  def creation_date
    created_at.strftime('%Y-%m-%d').to_s
  end

  def last_sign_in_datetime
    last_sign_in_at.strftime('%Y-%m-%d %H:%M:%S')
  end
end
