class PostsController < ApplicationController
  include QueryHelper
  include FilterHelper

  def show
    add_filter
    query_filtered_tags_and_photos

    render_tags_photos_and_filters
  end

  def edit
    remove_filter
    @filters.length > 0 ? query_filtered_tags_and_photos : query_base_tags_and_photos

    render_tags_photos_and_filters
  end

end