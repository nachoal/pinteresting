class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]


 # 7 main actions
  def index
    @pins = Pin.all
  end

  def show
  end

 
  def new
    @pin = Pin.new
  end

  
  def edit
  end

  def create
    @pin = Pin.new(pin_params)

    respond_to do |format|
      if @pin.save
        format.html { redirect_to @pin, notice: 'Pin was successfully created.' }
    
      else
        format.html { render :new }

        end
    end
  end

 
  def update
    respond_to do |format|
      if @pin.update(pin_params)
        format.html { redirect_to @pin, notice: 'Pin was successfully updated.' }
       else
        format.html { render :edit }
          end
    end
  end

  def destroy
    @pin.destroy
    respond_to do |format|
      format.html { redirect_to pins_url, notice: 'Pin was successfully destroyed.' }
      end
  end

  #private controllers 
  private
  def set_pin
      @pin = Pin.find(params[:id])
    end

     def pin_params
      params.require(:pin).permit(:description)
    end
end
