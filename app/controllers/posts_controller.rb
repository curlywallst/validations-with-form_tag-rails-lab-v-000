require 'pry'

class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.new(post_params)
    if @post.valid?
      @post = Post.find(params[:id])
    # if @post.update(post_params)
      @post.update(post_params)
      redirect_to(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
