class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #add this to the controller- why no user controller?
  #attr_accessible :email, :password, :password_confirmation, :remember_me
end
