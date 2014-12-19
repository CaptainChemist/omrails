class PinsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :require_permission, only: [:edit,:destroy,:update]
  respond_to :html, :xml, :json
  before_action :set_pin, only: [:show, :edit, :update, :destroy]

  def index
    @pins = Pin.order("created_at desc").page(params[:page]).per_page(20)
    respond_with(@pins)
  end

  def show
    respond_with(@pin)
  end

  def new
    @pin = current_user.pins.new 
    respond_with(@pin)
  end

  def edit
    @pin = current_user.pins.find(params[:id])
  end

  def create
    @pin = current_user.pins.new(pin_params)
    @pin.save
    respond_with(@pin)
  end

  def update
    @pin = current_user.pins.find(params[:id])
    @pin.update(pin_params)
    respond_with(@pin)
  end

  def destroy
    @pin = current_user.pins.find(params[:id])
    @pin.destroy
    respond_with(@pin)
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def pin_params
      params.require(:pin).permit(:description, :image, :image_remote_url)
    end

    def require_permission
        if current_user != Pin.find(params[:id]).user
          redirect_to pins_path
        end
    end


end
