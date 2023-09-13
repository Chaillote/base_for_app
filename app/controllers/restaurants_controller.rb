
def chef_name
  @chef_name = @restaurant.chef_name
end

def top
  @restaurants = Restaurant.where(rating: 5)
end

# GET /restaurants
def index
  @restaurants = Restaurant.all
end

# GET /restaurants/1
def show
end

# GET /restaurants/new
def new
  @restaurant = Restaurant.new
end


class RestaurantsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end
  --------------------------------------------

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants
  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant, notice: "Restaurant was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    # @review.restaurant_id = @restaurant.id
    if @review.save # si il save bien, il renvoie l'instance, sinon renvoie false
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
    end
  end
  ----------------------------------------------------------
  # PATCH/PUT /restaurants/1
  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: "Restaurant was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /restaurants/1
  def destroy
    @restaurant.destroy
    redirect_to restaurants_url, notice: "Restaurant was successfully destroyed.", status: :see_other
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to restaurant_path(@review.restaurant)
  end
  -------------------------------------------------------
    private

    def review_params
      params.require(:review).permit(:content)
    end
    -------------------------------------------------------------------------------------------------------

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :rating)
    end


end

---------------------------------------
#page home
class PagesController < ApplicationController
skip_before_action :authenticate_user!, only: [ :home ]

def home
end


def profile
  @trips = Trip.all
end

end

-----------------------------------------------
