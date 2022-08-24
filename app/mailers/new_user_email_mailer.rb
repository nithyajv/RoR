class NewUserEmailMailer < ApplicationMailer
  def verify_user(user)
    @user = user
    @url='http://127.0.0.1:3000/users/sign_in'
    #@url = link_to 'Confirm my account', confirmation_url(@resource, confirmation_token: @token) 
    mail(to: @user.email, subject: "Verify your account")
  end
  
  def task_mail(user,tasklist)
    @user=user
    @tasklist=tasklist
    mail(to: @user.email,subject:"Task assigned")

  end

  def task_update(user,tasklist)
    @user=user
    @tasklist=tasklist
    mail(to: @user.email,subject:"Task Updated")

  end

  def task_due(user,tasklist)
    @user=user
    @tasklist=tasklist
    mail(to: @user.email,subject:"Task reminder")
  end

end
