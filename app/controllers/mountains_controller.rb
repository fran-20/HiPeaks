class MountainsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
    @mountains = Mountain.all
  end

  def show
    @mountain = Mountain.find(params[:id])
    @reviews = @mountain.reviews
  end
end