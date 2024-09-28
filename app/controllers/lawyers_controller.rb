class LawyersController < ApplicationController
  def index
    @lawyers = Lawyer.all
    render :index
  end
end
