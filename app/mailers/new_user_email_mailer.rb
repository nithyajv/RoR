class NewUserEmailMailer < ApplicationMailer
  def verify_user(user)
    @user = user
    @url='http://127.0.0.1:3000/users/sign_in'
    #@url = link_to 'Confirm my account', confirmation_url(@resource, confirmation_token: @token) 

    mail(to: @user.email, subject: "Verify your account")
  end
end
