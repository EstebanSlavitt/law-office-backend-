class LawyersController < ApplicationController
  def index
    @lawyers = Lawyer.all
    render :index
  end

  def create
    @lawyer = Lawyer.new(lawyer_params)

    if @lawyer.save
      render :show, status: :created
    else
      render json: { errors: @lawyer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def show
    @lawyer = Lawyer.find(params[:id])
    render :show
  end

  private

  def lawyer_params
    params.require(:lawyer).permit(:name, :title, :bio, :email, :phone)
  end
end
