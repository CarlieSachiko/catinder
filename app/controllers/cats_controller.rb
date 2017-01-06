class CatsController < ApplicationController

  before_action :set_cat, only: [:show]


  def index
    @cats = Cat.all
    # @random = Cat.order('RAND()').limit(1)
    if params[:random]
      n = @cats.length
      rnd_idx = rand(0...n).limit(1)
      cat = @cats[rnd_idx]
      # render :show(cat)
      # redirect_to '/cats' + cat.id.to_s, cat_path(cat)
      redirect_to "/cats/#{cat.id}?random=true"
    end
  end

  def new
    @cat = Cat.new
  end

  def show
  end

  def create
    @cat = Cat.create(cat_params)

    if @cat.save
      redirect_to cat_path(@cat)
    else
      render :new
    end
  end

  private
    def set_cat
      @cat = Cat.find(params[:id])
      # use the :id to find one cat in the database
    end

    def cat_params
      params.require(:cat).permit(:name, :image_uri)
      # whitelist all of the vampire attributes so that your forms work!
    end

end
