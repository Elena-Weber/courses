class UsersController < ApplicationController

  def index
      # @users = User.all.order(created_at: :desc)
      
      # for using with ransack
      @q = User.ransack(params[:q])
      @users = @q.result(distinct: true)
    end
end