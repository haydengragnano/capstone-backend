class UsersController < ApplicationController

  before_action :authenticate_user, except: [:create, :show]

  def create
    user = User.new(
      handle: params[:handle],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: user, 
      status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def show
    user = User.find(params[:id])
    render json: user 
  end
  
  def update
    user = User.find(params[:id])
    user.handle = params[:handle] || user.handle
    user.email = params[:email] || user.email
    user.image_url = params[:image_url] || user.image_url
    user.stream_url = params[:stream_url] || user.stream_url
    user.bio = params[:bio] || user.bio
    user.game_id = params[:game_id] || user.game_id
    if user.save
      # remove old tags
      current_user.user_tags.destroy_all
      # add new tags
      params[:tag_ids].each do |tag_id|
        UserTag.create(
          user_id: current_user.id, 
          tag_id: tag_id
        )
      end
      render json: user
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: {message: "we'll pour one out for you"}
  end

end
