class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action  :authenticate_user!


  # GET /users or /users.json
  def index
    @users = User.all

    respond_to do |format|
      format.html

      format.pdf do
        pdf = UserPdf.new(@users)
        #pdf.text "Hellow World!"
        send_data pdf.render,
          filename: "user.pdf",
          type: 'application/pdf',
          disposition: 'attachment'
      end
      format.csv
    end
  end

  # GET /users/1 or /users/1.json
  def show
    @tasklist=Tasklist.all.select{|x| x.user_id==set_user.id}
    @task=[]
    @tasklist.each do |x|
      @task.append(x.Taskname)
    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    #NewUserEmailMailer.verify_user(@user).deliver_now


    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "user was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "user was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "user was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      #@user.tasklists.save

      params.require(:user).permit(:firstname, :lastname, :dob)
    end

end
