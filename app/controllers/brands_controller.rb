class BrandsController < ApplicationController

  def show
    # if user signed in, else show id 1
    @brand = Brand.find_by(id: params[:id])
  end

end