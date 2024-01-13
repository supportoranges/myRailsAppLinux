class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
   # @products = Product.where("profile_id = ?", "%#{params[:profile_id]}%")
    @products = Product.where("profile_id = ?", params[:profile_id])
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)
    puts(product_params)
    puts(@product.internal_code)
    puts(@product.detail)
    puts(@product.pic)
    puts(@product.profile_id)
    respond_to do |format|
      if @product.save
#        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.html { redirect_to :controller => 'products', :profile_id => @product.profile_id, :action => 'index', notice: 'Product successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        puts(@product.errors.full_messages)
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to :controller => 'products', :profile_id => @product.profile_id, :action => 'index', notice: 'Product successfully updated.' }
        format.json { render :show,  status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to :controller => 'products', notice: 'Product was successfully deleted.' }
      #format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:internal_code, :detail, :pic, :profile_id)
    end
end