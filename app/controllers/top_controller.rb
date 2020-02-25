class TopController < ApplicationController

  #application.html.erbを適用したくない
  def index
    render layout: false
  end
  
end
