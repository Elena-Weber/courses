class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def index
      # @users = User.all.order(created_at: :desc)
      
      # for using with ransack
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
  end
  
    # GET /users/1 or /users/1.json
  def show
  end
  
    # GET /users/1/edit
  def edit
    authorize @user
  end
  
  # PATCH/PUT /users/1 or /users/1.json
  def update
    authorize @user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "Yay! The user has been successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    authorize @user
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "The user has been successfully deleted." }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.friendly.find(params[:id])
    end
    
    def user_params
      params.require(:user).permit({role_ids: []})
    end
    
end