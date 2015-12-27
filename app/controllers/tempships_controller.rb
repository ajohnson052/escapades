class TempshipsController < ApplicationController

  def create
    @temp = User.find(params[:temp_id])
    @tempship = current_user.tempships.build(temp_id: params[:temp_id])
    if @tempship.save
      flash[:notice] = "#{@temp.email} will be notified of your friend request"
    end
    redirect_to user_path(@temp)
  end

  def destroy
    if params[:user_id]
      @tempship = Tempship.find_by(user_id: params[:user_id], temp_id: current_user.id)
    else
      @tempship = Tempship.find_by(user_id: current_user.id, temp_id: params[:temp_id])
    end
    authorize! :destroy, @tempship
    @tempship.destroy
    flash[:notice] = "You have cancelled this friend request"
    redirect_to user_path(current_user)
  end
end
