class UsersController < ApplicationController
  before_action :logged_in_user, only: []
  before_action :correct_user,   only: []
  before_action :admin_user, only: [:index, :edit, :new, :all]
  before_action :second_tier_user, only: [:front, :back]
  #make a page for all, front, and back (for permissions)
  
  def index
    @users = User.all
  end 

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  
  # Back of House evaluation form
  def back
    @users = User.order("name").where(:role => 2).page(params[:page]).per(1)
  end
  
  # Front of House evaluation form
  def front
    @users = User.order("name").where(:role => 1).page(params[:page]).per(1)
  end
  
  # All evaluation form (for directors)
  def all
    @users = User.order("name").where.not(:role => 0).page(params[:page]).per(1)
  end
 
  def create
    @user = User.new(user_params)
    if @user.save
      @user.update_attribute :question_one_new, 0.0
      @user.update_attribute :question_two, 0.0
      @user.update_attribute :question_three, 0.0
      @user.update_attribute :question_four, 0.0
      @user.update_attribute :question_five, 0.0
      @user.update_attribute :one_counter, 0
      @user.update_attribute :two_counter, 0
      @user.update_attribute :three_counter, 0
      @user.update_attribute :four_counter, 0
      @user.update_attribute :five_counter, 0
      if @user.role == 0 
         @user.update_attribute :admin, true
      end
      if @user.role == 3 || @user.role == 4 || @user.role == 5
         @user.update_attribute :second_tier, true
      else
        @user.update_attribute :second_tier, false
      end
      #log_in @user
      flash[:success] = "Team Member successfully Created!"
      redirect_to users_url
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end 
  
  
  #question_one_new = final result
  #current_one = current result
  #total_one = all the results
  def update
    @user = User.find(params[:id])
    average = 0
    
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      
      # QUESTION ONE: HUNGER FOR WISDOM
      if @user.current_one == 1 
         @user.increment(:one_counter, 1)
         @user.save
         @user.increment(:total_one, 1)
         average = (@user.total_one / @user.one_counter)
         @user.update_attribute :question_one_new, average
      end
      if @user.current_one == 2
         @user.increment(:one_counter, 1)
         @user.save
         @user.increment(:total_one, 2)
         average = (@user.total_one / @user.one_counter)
         @user.update_attribute :question_one_new, average
      end
      if @user.current_one == 3 
         @user.increment(:one_counter, 1)
         @user.save
         @user.increment(:total_one, 3)
         average = (@user.total_one / @user.one_counter)
         @user.update_attribute :question_one_new, average
      end
      if @user.current_one == 4
         @user.increment(:one_counter, 1)
         @user.save
         @user.increment(:total_one, 4)
         average = (@user.total_one / @user.one_counter)
         @user.update_attribute :question_one_new, average
      end
      if @user.current_one == 5
         @user.increment(:one_counter, 1)
         @user.save
         @user.increment(:total_one, 5)
         average = (@user.total_one / @user.one_counter)
         @user.update_attribute :question_one_new, average
      end
      
      # QUESTION TWO: EXPECT THE BEST
      average1 = 0
      if @user.current_two == 1 
         @user.increment(:two_counter, 1)
         @user.save
         @user.increment(:total_two, 1)
         average1 = (@user.total_two / @user.two_counter)
         @user.update_attribute :question_two, average1
      end
      if @user.current_two == 2
         @user.increment(:two_counter, 1)
         @user.save
         @user.increment(:total_two, 2)
         average1 = (@user.total_two / @user.two_counter)
         @user.update_attribute :question_two, average1
      end
      if @user.current_two == 3 
         @user.increment(:two_counter, 1)
         @user.save
         @user.increment(:total_two, 3)
         average1 = (@user.total_two / @user.two_counter)
         @user.update_attribute :question_two, average1
      end
      if @user.current_two == 4
         @user.increment(:two_counter, 1)
         @user.save
         @user.increment(:total_two, 4)
         average1 = (@user.total_two / @user.two_counter)
         @user.update_attribute :question_two, average1
      end
      if @user.current_two == 5
         @user.increment(:two_counter, 1)
         @user.save
         @user.increment(:total_two, 5)
         average1 = (@user.total_two / @user.two_counter)
         @user.update_attribute :question_two, average1
      end
      
      # QUESTION THREE: ACCEPT RESPONSIBILITY
      average2 = 0
      if @user.current_three == 1 
         @user.increment(:three_counter, 1)
         @user.save
         @user.increment(:total_three, 1)
         average2 = (@user.total_three / @user.three_counter)
         @user.update_attribute :question_three, average2
      end
      if @user.current_three == 2
         @user.increment(:three_counter, 1)
         @user.save
         @user.increment(:total_three, 2)
         average2 = (@user.total_three / @user.three_counter)
         @user.update_attribute :question_three, average2
      end
      if @user.current_three == 3 
         @user.increment(:three_counter, 1)
         @user.save
         @user.increment(:total_three, 3)
         average2 = (@user.total_three / @user.three_counter)
         @user.update_attribute :question_three, average2
      end
      if @user.current_three == 4
         @user.increment(:three_counter, 1)
         @user.save
         @user.increment(:total_three, 4)
         average2 = (@user.total_three / @user.three_counter)
         @user.update_attribute :question_three, average2
      end
      if @user.current_three == 5
         @user.increment(:three_counter, 1)
         @user.save
         @user.increment(:total_three, 5)
         average2 = (@user.total_three / @user.three_counter)
         @user.update_attribute :question_three, average2
      end
      
      # QUESTION FOUR: RESPOND WITH COURAGE
      average3 = 0
      if @user.current_four == 1 
         @user.increment(:four_counter, 1)
         @user.save
         @user.increment(:total_four, 1)
         average3 = (@user.total_four / @user.four_counter)
         @user.update_attribute :question_four, average3
      end
      if @user.current_four == 2
         @user.increment(:four_counter, 1)
         @user.save
         @user.increment(:total_four, 2)
         average3 = (@user.total_four / @user.four_counter)
         @user.update_attribute :question_four, average3
      end
      if @user.current_four == 3 
         @user.increment(:four_counter, 1)
         @user.save
         @user.increment(:total_four, 3)
         average3 = (@user.total_four / @user.four_counter)
         @user.update_attribute :question_four, average3
      end
      if @user.current_four == 4
         @user.increment(:four_counter, 1)
         @user.save
         @user.increment(:total_four, 4)
         average3 = (@user.total_four / @user.four_counter)
         @user.update_attribute :question_four, average3
      end
      if @user.current_four == 5
         @user.increment(:four_counter, 1)
         @user.save
         @user.increment(:total_four, 5)
         average3 = (@user.total_four / @user.four_counter)
         @user.update_attribute :question_four, average3
      end
      
      # QUESTION FIVE: THANK OTHERS FIRST
      average4 = 0
      if @user.current_five == 1 
         @user.increment(:five_counter, 1)
         @user.save
         @user.increment(:total_five, 1)
         average4 = (@user.total_five / @user.five_counter)
         @user.update_attribute :question_five, average4
      end
      if @user.current_five == 2
         @user.increment(:five_counter, 1)
         @user.save
         @user.increment(:total_five, 2)
         average4 = (@user.total_five / @user.five_counter)
         @user.update_attribute :question_five, average4
      end
      if @user.current_five == 3 
         @user.increment(:five_counter, 1)
         @user.save
         @user.increment(:total_five, 3)
         average4 = (@user.total_five / @user.five_counter)
         @user.update_attribute :question_five, average4
      end
      if @user.current_five == 4
         @user.increment(:five_counter, 1)
         @user.save
         @user.increment(:total_five, 4)
         average4 = (@user.total_five / @user.five_counter)
         @user.update_attribute :question_five, average4
      end
      if @user.current_five == 5
         @user.increment(:five_counter, 1)
         @user.save
         @user.increment(:total_five, 5)
         average4 = (@user.total_five / @user.five_counter)
         @user.update_attribute :question_five, average4
         flash[:success] = "Team member's scores were added! Please select 'Next Employee' below to continue"
      end
      
      
      
      # ADD ADMIN AND SECOND_TIER UPDATES HERE
      if @user.role == 0 
         @user.update_attribute :admin, true
      end
      if @user.role == 3 || @user.role == 4 || @user.role == 5
         @user.update_attribute :second_tier, true
         @user.update_attribute :admin, false
      end
      if @user.role == 1 || @user.role == 2
        @user.update_attribute :admin, false
        @user.update_attribute :second_tier, false
      end
      
      #flash[:success] = "Profile updated"
         redirect_to :back
    else
      render 'edit'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
  
  private
  
  def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :role, 
                                   :username, :admin, :question_one_new, :one_counter, :current_one, :question_two,
                                   :two_counter, :current_two, :total_two, :question_three, :three_counter, :current_three, :total_three,
                                   :question_four, :four_counter, :current_four, :total_four,
                                   :question_five, :five_counter, :current_five, :total_five)
  end
  
   # Before filters

    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
      store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
     # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
    end
    
    # Confirms an admin user.
    def admin_user
      redirect_to(current_user) unless current_user.admin?
    end
    
    # Confirms an manager user.
    def second_tier_user
      redirect_to(current_user) unless current_user.second_tier?
    end
  end
