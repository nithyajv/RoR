class TasklistsController < ApplicationController
  before_action :set_tasklist, only: %i[ show edit update destroy ]
  before_action  :authenticate_user!

  # GET /tasklists or /tasklists.json
  def index
    @tasklists = Tasklist.all

    respond_to do |format|
      format.html

      format.pdf do
        pdf = TasklistPdf.new(@tasklists)
        #pdf.text "Hellow World!"
        send_data pdf.render,
          filename: "tasklist.pdf",
          type: 'application/pdf',
          disposition: 'attachment'
      end

      format.csv
    end
  end

  # GET /tasklists/1 or /tasklists/1.json
  def show
  end

  # GET /tasklists/new
  def new
    @tasklist = Tasklist.new
  end

  # GET /tasklists/1/edit
  def edit
  end

  # POST /tasklists or /tasklists.json
  def create
    @tasklist = Tasklist.new(tasklist_params)

    respond_to do |format|
      if @tasklist.save
        @user = User.find_by_id(@tasklist.user_id)
        NewUserEmailMailer.task_mail(@user,@tasklist).deliver_now
        format.html { redirect_to tasklist_url(@tasklist), notice: "Tasklist was successfully created." }
        format.json { render :show, status: :created, location: @tasklist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tasklist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasklists/1 or /tasklists/1.json
  def update
    respond_to do |format|
      if @tasklist.update(tasklist_params)
        @user = User.find_by_id(@tasklist.user_id)
        NewUserEmailMailer.task_update(@user,@tasklist).deliver_now
        format.html { redirect_to tasklist_url(@tasklist), notice: "Tasklist was successfully updated." }
        format.json { render :show, status: :ok, location: @tasklist }
        format.js
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tasklist.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /tasklists/1 or /tasklists/1.json
  def destroy
    @tasklist.destroy

    respond_to do |format|
      format.html { redirect_to tasklists_url, notice: "Tasklist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tasklist
      @tasklist = Tasklist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tasklist_params
      #@user.tasklist.save
      params.require(:tasklist).permit(:Taskname, :Status, :Duedate, :Details, :user_id)
    end
end
