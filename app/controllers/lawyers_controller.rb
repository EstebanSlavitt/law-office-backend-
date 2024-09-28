class LawyersController < ApplicationController
  def update
    @lawyer = Lawyer.find_by(id: params[:id])

    if @lawyer.update(
      name: params[:name] || @lawyer.name,
      title: params[:title] || @lawyer.title,
      bio: params[:bio] || @lawyer.bio,
      email: params[:email] || @lawyer.email,
      phone: params[:phone] || @lawyer.phone,
    )
      render :show
    else
      render json: { errors: @lawyer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def lawyer_params
    params.require(:lawyer).permit(:name, :title, :bio, :email, :phone)
  end
end
