class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :bookings
  has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         def admin?
             is_admin
           end

           def display_name
              if self.username.present?
                self.username
              else
                self.email.split("@").first
              end
            end

end
