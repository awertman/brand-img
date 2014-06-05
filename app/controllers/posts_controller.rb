class PostsController < ApplicationController

  def show
    p "---------- inside posts controller -----------"
    p params
    return {test: "info"}.to_json
  end

end