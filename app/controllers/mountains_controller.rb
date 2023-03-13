class MountainsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
    @mountains = Mountain.all
    @mountains = Mountain.page(params[:page]).per(5)
  end

  def show
    @mountain = Mountain.find(params[:id])
    @reviews = @mountain.reviews
  end
end