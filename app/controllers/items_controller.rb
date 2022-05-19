class ItemsController < ApplicationController
  before_action :set_item, only: %i[ show edit update destroy  soft_deletion ]

  # GET /items or /items.json
  def index
    @items = Item.all
    @with_out_deleted = Item.without_deleted
    @deleted = Item.deleted
    @with_deleted = Item.with_deleted
  
  end

  # GET /items/1 or /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
  end

  # POST /items or /items.json
  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to ites_path, notice: "Item was successfully created." }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1 or /items/1.json
  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to item_url(@item), notice: "Item was successfully updated." }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1 or /items/1.json
  def destroy
    @item.destroy

    respond_to do |format|
      format.html { redirect_to items_url, notice: "Item was successfully destroyed." }
      format.json { head :no_content }
    end
  end


  def soft_deletion
    # @Item.soft_delete(params[:mode], params[:comment])
    @item.soft_delete(:soft, "params[:comment")
    respond_to do |format|
      # format.html { redirect_to Item.comments.new , notice: "Item was successfully deleted." }
      #  format.html { redirect_to controller: :comments, action: :new, notice: "Item was successfully deleted." }
       format.html { redirect_to new_item_comment_path(@item), notice: "Item was successfully deleted." }
      format.json { head :no_content } 
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item
      @item = Item.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_params
      params.require(:item).permit(:name, :description, :deleted_at , :soft_deletion )
    end
end