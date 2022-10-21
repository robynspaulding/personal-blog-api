class PostsController < ApplicationController

  def index
    post = Post.all
    render json: posts.as_json
  end

  def create
    post = Post.new(
      title: params[:title],
      body: params[:body],
      date: params[:date],
      image: params[:image]
    )
    post.save
    render json: post.as_json
  end

  def show
    post = Post.find_by(id: params[:id])
    render json: post.as_json
  end

  def update
    post = Post.find_by(id: params[:id])
    post.title = params[:title] || post.title
    post.body = params[:body] || post.body
    post.date = params[:date] || post.date
    post.image = params[:image] || post.image

    post.save

    render json: post.as_json
  end

  def destroy
    post = Post.find_by(id: params[:id])
    post.destroy
    render json: {message: "Post successfully deleted."}
  end
end
