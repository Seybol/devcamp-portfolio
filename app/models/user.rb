class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #confirmable -> The user has to confirm he's a human with a link in a mail.
  #lockable -> We can lock an user if he, for ex, fail login x times.
  #timeoutable -> We can log out an user after x hours/days ...
end
