module Spree
  module Api
    module V1
      TaxonsController.class_eval do

        def products
          # Returns the products sorted by their position with the classification
          # Products#index does not do the sorting.
          taxon = Spree::Taxon.find_by(permalink: params[:permalink])
          @products = taxon.products.ransack(params[:q]).result
          @products = @products.page(params[:page]).per(params[:per_page] || 500)
          render "spree/api/v1/products/index"
        end
      end
    end
  end
end
