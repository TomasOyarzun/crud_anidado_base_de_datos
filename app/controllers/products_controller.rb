class ProductsController < ApplicationController
	def create
		@category = Category.find(params[:category_id])
		@product = @category.products.build(product_params)
		@product.save
		redirect_to category_path(@product.category_id)
	end

	def destroy
		@product = Product.find(params[:id])
    @product.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
     end
  end

	private
	def product_params
  	params.require(:product).permit(:name, :price, :category_id)
	end
end
