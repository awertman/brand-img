class PostsController < ApplicationController

  def show
    p "---------- inside posts controller -----------"
    @filters = session[:filters].push(params[:id])
    @filters = session[:filters] if session[:filters].uniq!

    @tag_options = Tag.get_tags_by(@filters, 20)
    # @tag_options = Brand.get_tags_by_filters()
    render :json => {test: "info"}
  end

end