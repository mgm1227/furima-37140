class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @user = User.find(params[:id])
  end
end
