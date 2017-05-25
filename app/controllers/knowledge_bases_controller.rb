class KnowledgeBasesController < ApplicationController
  before_action :set_knowledge_basis, only: [:show, :edit, :update, :destroy]

  # GET /knowledge_bases
  # GET /knowledge_bases.json
  def index
    @knowledge_bases = KnowledgeBase.all
    @knowledge_published =KnowledgeBase.where('published = ?', true)
    @knowledge_unpublished =KnowledgeBase.where('published = ?', false)
  end

  # GET /knowledge_bases/1
  # GET /knowledge_bases/1.json
  def show
  end

  # GET /knowledge_bases/new
  def new
    @knowledge_basis = KnowledgeBase.new
  end

  # GET /knowledge_bases/1/edit
  def edit
  end

  # POST /knowledge_bases
  # POST /knowledge_bases.json
  def create
    @knowledge_basis = KnowledgeBase.new(knowledge_basis_params)

    respond_to do |format|
      if @knowledge_basis.save
        format.html { redirect_to @knowledge_basis, notice: 'Knowledge base was successfully created.' }
        format.json { render :show, status: :created, location: @knowledge_basis }
      else
        format.html { render :new }
        format.json { render json: @knowledge_basis.errors, status: :unprocessable_entity }
      end
    end
  end

 
  # PATCH/PUT /knowledge_bases/1
  # PATCH/PUT /knowledge_bases/1.json
  def update
    respond_to do |format|
      if @knowledge_basis.update(knowledge_basis_params)
        format.html { redirect_to @knowledge_basis, notice: 'Knowledge base was successfully updated.' }
        format.json { render :show, status: :ok, location: @knowledge_basis }
      else
        format.html { render :edit }
        format.json { render json: @knowledge_basis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /knowledge_bases/1
  # DELETE /knowledge_bases/1.json
  def destroy
    @knowledge_basis.destroy
    respond_to do |format|
      format.html { redirect_to knowledge_bases_url, notice: 'Knowledge base was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def select_chapter
  @topic = Topic.find(params[:topic_id])
  @chapter = @topic.chapters
 end

 



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_knowledge_basis
      @knowledge_basis = KnowledgeBase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def knowledge_basis_params
      params.require(:knowledge_base).permit(:title, :body, :is_private, :chapter_id, :topic_id, :published,:links, :user_id)
    end
end
