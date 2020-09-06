class PortfoliosController < ApplicationController
    before_action :set_portfolio_item, only: [:edit, :update]
    def index
        @portfolio_items = Portfolio.all
    end

    def new
        @portfolio_item = Portfolio.new
    end

    def create
        @portfolio_item = Portfolio.new(portfolio_item_params)
        respond_to do |format|
          if @portfolio_item.save
            format.html { redirect_to portfolios_path, notice: 'portfolio_item was successfully created.' }
            format.json { render :show, status: :created, location: @portfolio_item }
          else
            format.html { render :new }
            format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
          end
        end
    end

    def edit
    end

    def update
        respond_to do |format|
            if @portfolio_item.update(portfolio_item_params)
              format.html { redirect_to portfolios_path, notice: 'portfolio_item was successfully updated.' }
              format.json { render :show, status: :ok, location: @portfolio_item }
            else
              format.html { render :edit }
              format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
            end
        end
    end

    private
    def set_portfolio_item
        @portfolio_item = Portfolio.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def portfolio_item_params
      params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image)
    end
end
