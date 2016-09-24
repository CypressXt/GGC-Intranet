class User < ActiveRecord::Base
    attr_accessor :password_confirmation
    validates :username, :email, :password, :password_confirmation, presence: true
    validates :password, confirmation: true
    validates :username, length: { in: 4..20 }
    validates :email, uniqueness: true

    def encrypt_password(password)
        return Digest::SHA2.new(512).hexdigest(password)
    end

    def authenticate(password)
        if Digest::SHA2.new(512).hexdigest(password) == self.password
            true
        end
    end

    def change_password(password)
        passwd=self.encrypt_password(password)
        self.password = passwd
        self.password_confirmation = passwd
        self.save
    end

    def generate_token
        self.token = Digest::SHA2.new(512).hexdigest([Time.now, rand].join)
        self.password_confirmation = self.password
        self.token_update = Time.now
        self.save
    end
end
