class UsersController < ApplicationController
    def index
        @user = User.all
    end

    def show
        @user = User.find(params[:id])
    end  

    def new
        @user = User.new
    end

    def edit
        @user = User.find(params[:id])
    end

    def login_user
    
        @x = user_params[:email]
        @y = user_params[:password]
        print @x

        @user = User.authenticate(@x, @y)
        
        
        #@user = User.where("email = ?", params[:email]).select( "name, email, password")
        
        if User.exists?( email: @x ) && User.exists?( password: @y )
            redirect_to @user     
        else
            render 'login'
        end 

    end    

    def create
        @user = User.new(user_params)
    
        if User.exists?( email: @user.email )
            render 'new'
        else
            @user.save    
            redirect_to @user
        end    
    end

    def update
        @user = User.find(params[:id])
       
        if @user.update(user_params)
          redirect_to @user
        else
          render 'edit'
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
     
        redirect_to users_path
    end
       
      private
        def user_params
          params.require(:user).permit(:name, :email, :password)
        end
end


