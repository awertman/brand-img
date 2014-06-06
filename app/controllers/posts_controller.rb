class PostsController < ApplicationController

  def show
    p "-------- posts controller -------"
    filters = session[:filters].push(params[:id])
    filters = session[:filters] if session[:filters].uniq!
    brand = Brand.find_by(id: session[:brand])

    @tag_options = Tag.get_tags_by(brand, filters, 20) ########## does this take into account brand?
    @posts = Post.get_posts_and_sort_by_tag_matches( brand, filters, @tag_options ).first(30)

    render :json => {:tags => (render_to_string 'posts/_tag_list', layout: false), :photos => (render_to_string 'posts/_photo_list', layout: false)}
  end

end