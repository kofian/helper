class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :likes
  has_many :projects
  has_many :pledges
  has_many :donations, through: :pledges
  has_many :carts, through: :pledges

  def name
   [first_name, last_name].join(" ")
   end


end
