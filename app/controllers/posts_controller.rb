class PostsController < ApplicationController
  include ApplicationHelper

  def show
    add_filter
    get_filtered_tags_and_photos
    render_tags_photos_and_filters
  end

  def edit
    remove_filter
    @filters.length > 0 ? get_filtered_tags_and_photos : get_base_tags_and_photos
    render_tags_photos_and_filters
  end

end