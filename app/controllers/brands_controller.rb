class BrandsController < ApplicationController

  def show
    # if user signed in, else show id 1
    @brand = Brand.find_by(id: params[:id])
    session[:brand] = params[:id]
    session[:filters] = []

    @tag_options = Brand.get_filtered_tags_by( @brand, 20 )
    @posts = Brand.get_and_sort_by_tag_matches( @brand, @tag_options ).first(20)

  end

end