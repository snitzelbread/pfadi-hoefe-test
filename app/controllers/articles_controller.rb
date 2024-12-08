class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]
  before_action :require_login_leader, only: %i[ create edit update destroy ]

  # GET /articles or /articles.json
  def index
    # Default sort order is descending (newest first)
    sort_order = params[:sort] || "desc"

    # Fetch articles, ordered by date based on the sort parameter
    @articles = Article.order(date: sort_order)
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = Article.new(article_params)
    @article.leader_id = current_leader.id

    if @article.save
      flash[:notice] = "Artikel wurde erfolgreich erstellt!"
      render :show, status: :created, location: @article
    else
      flash[:alert] = "Ups, da ist was falsch gelaufen. Der Artikel konnte nicht gespeichert werden!"
      render :new, status: :unprocessable_content
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    @article.leader_id = current_leader.id
    if @article.update(article_params)
      flash[:notice] = "Artikel wurde erfolgreich gespeichert!"
      redirect_to article_path(@article)
    else
      flash[:alert] = "Ups, da ist was falsch gelaufen. Der Artikel konnte nicht gespeichert werden!"
      render :edit, status: :unprocessable_content
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy!

    flash[:notice] = "Artikel wurde erfolgreich gelöscht!"
    redirect_to articles_path, status: :see_other
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :date, :image, :leader_id)
  end
end
