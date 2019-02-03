
class User < ApplicationRecord
    
    has_many :task, dependent: :destroy
    # validates :user, presence: true,
    #                   length: { minimum: 5 }
    def self.authenticate(email, login_password)
        user = User.find_by email: email
        return user
    end  

end
