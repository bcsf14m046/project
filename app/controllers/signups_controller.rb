class SignupsController < ApplicationController
    layout 'test'
    def new
        @signup= Signup.new
    end
    def create
        @rollnumber=params[:rollnumber]
        @password=params[:password]
        @check_box=params[:check_box]
        
        @signup= Signup.new()
        @signup.rollnumber=@rollnumber
        @signup.password=@password
    
        if(@check_box != nil)
            @signup.role=true
        else
            @signup.role=false
        end
        
        @std=@signup.rollnumber
      

        @temp= Signup.where(:rollnumber =>@std)
        
        if(@temp.count == 0)
            
            @signup.save
            render('/signups/haider')
        else
            
            render('/signups/again')
            
    
            
        end
    end
    def login
        @roll=params[:rollnumber]
        @pass=params[:password]
    if(@roll=="" && @pass=="")
            render('/signups/again')
    else
        @login= Signup.find_by_rollnumber(@roll)
        if(@login)
                session[:roll_number]=@login.rollnumber
                if( @login && (@pass==@login.password) )
                    
                    if(@login.role ==true)
                        redirect_to( :controller => 'subjects', :action => 'list' )
                    else
                        redirect_to( :controller => 'student', :action => 'new' )
                    end
                else
                    render('/signups/new')
                end
        else
            render('/signups/haider')
        end
    end
    end
    def paramLoin
        params.require(:login).permit(:rollnumber,:password)
    end
    def my_params
        params.require(:signup).permit(:rollnumber,:password, :role)
    end
    def duplicate
        params.require(:signup).permit(:rollnumber)
    end
end
