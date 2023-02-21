class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: [:show]

  def show
    @current_user = current_user
    @all_events = Event.all
    @user = User.find(params[:id])
  end

  private

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user == @user
  end


end
