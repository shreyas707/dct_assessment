class Api::V1::BatchesController < ApplicationController
  def index

  end

  def show
  	@batch = Batch.find(params[:id])
  end
end
