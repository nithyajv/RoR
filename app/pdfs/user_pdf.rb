class UserPdf < Prawn::Document
  include Prawn::View

  def initialize(users)
    super()
    @users=User.all
    user_no
    
  end

  def user_no
    table user_no_all    
  end

  def user_no_all
    [["firstname","lastname","dob"]]+
    @users.map do |user|
      [user.firstname,user.lastname,user.dob]
    end
  
  end
end