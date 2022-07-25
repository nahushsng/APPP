class PostsController < ApplicationController
before_action :get_post, only: [:show, :edit, :update, :destroy]
 def index
   @posts = Post.all
 end

 def show
 end

 def edit
 end

 def create
   @post = Post.new(post_params)
   if @post.save
   redirect_to @post, notice: "Post has been created!" 
   else 
    redirect_to new_post_path, notice: "No Text entered!!"
   end
 end

 def update 
   
   if @post.update(post_params)
   redirect_to @post, notice: "Post has been Updated!" 
   else
    redirect_to edit_post_path(@post), notice: "No Text entered!"
 end
end
 
 def destroy
   
   @post.destroy
   redirect_to posts_path, notice: "Post Deleted!"
 end
 
 def new
    @post = Post.new
 end


 private

 def get_post
  @post = Post.find(params[:id])
 end

 def post_params
params.require(:post).permit(:title,:body)
 end

end
