class DataController < ApplicationController
  def babies
    respond_to do |format|
      format.json { render json: Baby.all}
    end  
  end  
end
