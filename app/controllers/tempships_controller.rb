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
    @tempship = tempship.find(params[:id])
    if current_user == @tempship.user_id
      @temp = User.find(@tempship.temp_id)
    else
      @temp = User.find(@tempship.user_id)
    end
    @tempship.destroy
    flash[:notice] = "You have cancelled your friend request"
    redirect_to user_path(current_user)
  end
end
