class BrandsController < ApplicationController

  def show
    # if user signed in, else show id 1
    @brand = Brand.find_by(id: params[:id])
    @tag_options = @brand.get_filtered_tags_by( @brand, 20 ) # currently not using limit
    @posts = Post.get_and_sort_by_tag_matches( @brand, @tag_options )

  end

end