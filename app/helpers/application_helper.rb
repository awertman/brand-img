module ApplicationHelper

  def add_filter
    @filters = session[:filters].push(params[:id])
    @filters = session[:filters] if session[:filters].uniq!
    @brand = Brand.find_by(id: session[:brand])
  end

  def remove_filter
    session[:filters].reject! {|filter| filter == params[:id]}
    @filters = session[:filters]
    @brand = Brand.find_by(id: session[:brand])
  end

  def get_base_tags_and_photos
    @counted_tags = Tag.get_tags_by(@brand, @filters, 20)
    p "-------------------------------- counted tags"
    p @counted_tags
    @tag_options = Brand.get_filtered_tags_by( @brand, 20 )
    @posts = Brand.get_and_sort_by_tag_matches( @brand, @tag_options ).first(20)
  end

  def get_filtered_tags_and_photos
    @counted_tags = Tag.get_tags_by(@brand, @filters, 20)
    @posts = Post.get_posts_and_sort_by_tag_matches( @brand, @filters, @counted_tags ).first(30)
    @tag_options = Tag.remove_filters_from_listing(@brand, @filters, @counted_tags, 20)
  end

  def render_tags_photos_and_filters
    render :json => { :tags => (render_to_string 'brands/_tag_list', layout: false),
                      :photos => (render_to_string 'posts/_photo_list', layout: false),
                      :filters => (render_to_string 'posts/_filter_list', layout: false)}
  end

end
