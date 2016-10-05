# Preview all emails at http://localhost:3000/rails/mailers/register
class RegisterPreview < ActionMailer::Preview
    def welcome
        Register.welcome(User.first, "jkasndsjknjknsd")
    end
end
