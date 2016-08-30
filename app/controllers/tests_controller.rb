class TestsController < ApplicationController
  def show
    @id = params[:id]
  end
end
