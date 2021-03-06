class PortfoliosController < ApplicationController
    before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
    def index
        @portfolio_items = Portfolio.all # Portfolio.ruby_on_rails_portfolio_items 
    end

    def react
        @react_portfolio_items = Portfolio.react
    end

    def new
        @portfolio_item = Portfolio.new
        3.times{ @portfolio_item.technologies.build }
    end

    def create
        @portfolio_item = Portfolio.new(portfolio_item_params)
        respond_to do |format|
          if @portfolio_item.save
            format.html { redirect_to portfolios_path, notice: 'portfolio was successfully created.' }
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
              format.html { redirect_to portfolios_path, notice: 'portfolio was successfully updated.' }
              format.json { render :show, status: :ok, location: @portfolio_item }
            else
              format.html { render :edit }
              format.json { render json: @portfolio_item.errors, status: :unprocessable_entity }
            end
        end
    end

    def show
    end

    def destroy
        @portfolio_item.destroy
        respond_to do |format|
            format.html { redirect_to portfolios_url, notice: 'portfolio was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
    def set_portfolio_item
        @portfolio_item = Portfolio.find(params[:id])
    end
    # Only allow a list of trusted parameters through.
    def portfolio_item_params
        params.require(:portfolio).permit(:title, :subtitle, :body, :main_image, :thumb_image, technologies_attributes: [:name])
    end
end
