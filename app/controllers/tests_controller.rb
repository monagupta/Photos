class TestsController < ApplicationController
  def show
    @id = params[:id]
    render
  end
end
