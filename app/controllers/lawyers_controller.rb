class LawyersController < ApplicationController
  # GET /lawyer - List all lawyers
  def index
    @lawyers = Lawyer.all
    render :index
  end

  # POST /lawyer - Create a new lawyer
  def create
    @lawyer = Lawyer.new(lawyer_params)

    if @lawyer.save
      render :show, status: :created
    else
      render json: { errors: @lawyer.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # GET /lawyer/:id - Show a specific lawyer
  def show
    @lawyer = Lawyer.find_by(id: params[:id])

    if @lawyer
      render :show
    else
      render json: { message: "Lawyer not found" }, status: :not_found
    end
  end

  # PATCH /lawyer/:id - Update an existing lawyer
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

  # DELETE /lawyer/:id - Destroy a lawyer
  def destroy
    @lawyer = Lawyer.find_by(id: params[:id])

    if @lawyer
      @lawyer.destroy
      render json: { message: "Lawyer destroyed successfully" }, status: :ok
    else
      render json: { message: "Lawyer not found" }, status: :not_found
    end
  end

  private

  # Strong parameters to safely handle input
  def lawyer_params
    params.require(:lawyer).permit(:name, :title, :bio, :email, :phone)
  end
end
