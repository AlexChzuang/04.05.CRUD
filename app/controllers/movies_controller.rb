class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "新增電影成功！"
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find_by(id: params[:id])
  end

  def update 
    @movie = Movie.find_by(id: params[:id])

    if @movie.update(movie_params)
      redirect_to movies_path, notice: "電影編輯成功"
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find_by(id: params[:id])
    @movie.destroy if @movie
    redirect_to movies_path, notice: "電影資料已被刪除"
  end

  private
  def movie_params
    params.require(:movie).permit(:name, :year, :issued)
  end

end
