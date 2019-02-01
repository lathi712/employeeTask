class TasksController < ApplicationController
    def create
        @user = User.find(params[:user_id])
        @task = @user.task.create(task_params)
        redirect_to user_path(@user)
      end
     
      private
        def task_params
          params.require(:task).permit(:title, :description, :start, :end )
        end
end
