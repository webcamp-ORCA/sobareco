class Admin::ArtistsController < ApplicationController

before_action :ransack
   PER = 8
  def index
      @artist = Artist.new
      @artists = Artist.page(params[:page]).per(PER)
  end

  def create
        artist = Artist.new(artist_params)
        artist.save
        redirect_to admin_artists_path
  end

  def edit
      @artist = Artist.find(params[:id])
  end

  def update
        artist = Artist.find(params[:id])
        artist.update(artist_params)
        redirect_to admin_artists_path
  end

  def destroy
      artist = Label.find(params[:id])
      artist.destroy
      redirect_to admin_artists_path
  end

   private

    def artist_params
        params.require(:artist).permit(:artist_name)
    end

     def ransack
      @q = Product.ransack(params[:q])
    end

end
