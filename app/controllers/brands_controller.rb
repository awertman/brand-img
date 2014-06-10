class BrandsController < ApplicationController
  include QueryHelper
  include FilterHelper

  def show
    # if user signed in, else show id 1
    @brand = Brand.find_by(id: params[:id])
    session[:brand] = params[:id]
    session[:filters] = []
    @filters = session[:filters]

    get_base_tags_and_photos
  end

end