class DocsController < ApplicationController
  before_action :find_doc, only: [:show, :edit, :update, :destroy]

  def index
    @docs = Doc.all
  end

  def show
    # @doc = Doc.find_by(id: params[:id])
  end

  def new
    @doc = current_user.docs.build  
  end
    
  def create
    @doc = current_user.docs.build(doc_params)
    if @doc.save
      # show path
      redirect_to doc_path(@doc)
    else
      render 'new'
    end

  end

  def edit
  end

  def update
    if @doc.update_attributes(doc_params)
      redirect_to doc_path(@doc)
    else
      render 'edit'
    end
  end

  def destroy
    @doc.destroy
    redirect_to docs_path
  end

  private

  def find_doc
    @doc = Doc.find_by(id: params[:id])
  end

  def doc_params
    params.require(:doc).permit(:title, :content, :user_id)
  end
end
