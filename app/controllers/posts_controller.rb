class PostsController < ApplicationController

  def show
    p "---------- inside posts controller -----------"
    p params
    @tag_options = Brand.get_tags_by_filters()
    return {test: "info"}.to_json
  end

end