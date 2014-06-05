class BrandsController < ApplicationController

  def show
    # if user signed in, else show id 1
    @brand = Brand.find_by(id: params[:id])
    p @tag_options = @brand.get_filtered_tags_by( @brand, 20 )

  end

end