class PostsController < ApplicationController
    before_action(:authenticate_user!)
  def new
  end

  def create
    puts(params['post']['tittle'])
    new_category = Post.create(category: Category.find_by(name: 'Juegos') ,title: params['post']['tittle'], content: params['post']['content'])
    new_category.save()
    redirect_to(forum_path())
  end
end
