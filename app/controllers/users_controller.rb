class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit destroy]

  def create
    @user = User.new(review_params)
    @user.save

    if @user.save
      redirect_to list_path(@list)
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    @user.update(review_params)
  end

  def destroy
    @user.destroy
  end

  private

  def review_params
    params.require(:user).permit(:username, :first_name, :last_name, :address, :phone_number, :email, :encrypted_password)
    #POTENTIELLEMENT DU TRES MAUVAIS CODE A REVOIR
    # sachant qu'on est censé seulement valider username, email, et password
    # est ce que le fait de permit les params oblige à donner une valeur non nulle? - Alex
  end

  def set_user
    @user = User.find(params[:id])
  end
end
