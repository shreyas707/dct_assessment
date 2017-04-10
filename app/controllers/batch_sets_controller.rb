class BatchSetsController < ApplicationController
  before_action :set_batch_set, only: [:show, :edit, :update, :destroy]

  # GET /batch_sets
  # GET /batch_sets.json
  def index
    @batch_sets = BatchSet.all
  end

  # GET /batch_sets/1
  # GET /batch_sets/1.json
  def show
  end

  # GET /batch_sets/new
  def new
    @batch_set = BatchSet.new
    @batch_set_chapter_topic = BatchSetChapterTopic.new
  end

  # GET /batch_sets/1/edit
  def edit
    #@batch_set_chapter_topic = BatchSetChapterTopic.where("batch_set_id = ?", params[:id]).first
  end

  # POST /batch_sets
  # POST /batch_sets.json
  def create
    @batch_set = BatchSet.new(batch_set_params)
    respond_to do |format|
      if @batch_set.save
        format.html { redirect_to edit_batch_set_path(@batch_set), notice: 'Batch set was successfully created.' }
        format.json { render :show, status: :created, location: @batch_set }
      else
        format.html { render :new }
        format.json { render json: @batch_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /batch_sets/1
  # PATCH/PUT /batch_sets/1.json
  def update
    respond_to do |format|
      if @batch_set.update(batch_set_params)
        format.html { redirect_to @batch_set, notice: 'Batch set was successfully updated.' }
        format.json { render :show, status: :ok, location: @batch_set }
      else
        format.html { render :edit }
        format.json { render json: @batch_set.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /batch_sets/1
  # DELETE /batch_sets/1.json
  def destroy
    @batch_set.destroy
    respond_to do |format|
      format.html { redirect_to batch_sets_url, notice: 'Batch set was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_batch_set
      @batch_set = BatchSet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def batch_set_params
      params.require(:batch_set).permit(:set_date, :batch_id, batch_set_chapter_topics_attributes: [:id, :batch_id, :chapter_id, :topic_id, :_destroy], question_ids: [])
    end
end
