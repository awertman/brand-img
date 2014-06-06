class BrandsController < ApplicationController

  def show
    # if user signed in, else show id 1
    @brand_id = params[:id]
    session[:filters] = [Brand.find_by(id: @brand_id).name]

    @tag_options = Brand.get_filtered_tags_by( @brand_id, 20 )
    @posts = Post.get_and_sort_by_tag_matches( @brand_id, @tag_options ).first(20)

  end

end