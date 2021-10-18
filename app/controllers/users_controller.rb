class UsersController < ApplicationController
  def create
    user = User.new(
      handle: params[:handle],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
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
    user.handle = params[handle] || user.handle
    user.email = params[email] || user.email
    user.image_url = params[image_url] || user.image_url
    user.stream_url = params[stream_url] || user.stream_url
    user.bio = params[bio] || user.bio
    user.game_id = params[game_id] || user.game_id
    if product.save
      render json: product
    else
      render json: product.errors.full_messages, status: :unprocessable_entity
    end
  end

end
