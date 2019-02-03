class TasksController < ApplicationController
    def create
        @user = User.find(params[:user_id])
        @task = @user.task.create(task_params)
        redirect_to user_path(@user)
    end
    
    def edit
      @task = Task.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
     #@task = @user.task.update(task_params)
      if @user.task.update(task_params)
        redirect_to @task
      else
        render 'edit'
      end
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
   
        redirect_to task_path
    end

     
      private
        def task_params
          params.require(:task).permit(:title, :description, :start, :end )
        end
end
