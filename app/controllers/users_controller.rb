class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  def index
    @filter = params.fetch(:status, 'All')
    @page = (params.fetch(:page, Constants::DEFAULT_PAGE_NUMBER)).to_i
    @users ||= UserService::FetchLocalUserService.call(offset: @page, status_filter: @filter)

    respond_to do |format|
      format.html
      format.json { render json: @users }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  private

  def set_user
    @user ||= User.find(params[:id])
  end
end
