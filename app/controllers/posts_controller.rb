require('redcarpet/compat')

class PostsController < ApplicationController
  before_action(:authenticate_user!)

  def index
  end

  def new
  end

  def create
    new_category = Post.create(category: Category.find_by(id: params['post']['category']), title: params['post']['tittle'], content: params['post']['content'])
    new_category.save()
    redirect_to(forum_path())
  end

  def _post
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(title: params[:title], content: params[:content])
    redirect_to(forum_path())
  end
end
