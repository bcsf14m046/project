class SubjectsController < ApplicationController
    layout 'admin'
    def index 
        redirect_to(:action => 'list')
    end
    def list
        @roll=session[:roll_number]
        @subjects=Subject.where(:rollnumber =>@roll)
    end
    def login
        session[:roll_number]=''
        redirect_to(:controller=>'signups',:action => 'haider')
    end
    
    def show
        @roll=session[:roll_number]
        @instructor=  session[:roll_number]
        @subject= Subject.find(params[:id])
        session[:subject_name]=@subject.name
        session[:position]=@subject.position
        @temp=session[:subject_name]
        @announcement=Announcement.where(:position =>@subject.position )
      
        
        
    end
    def new
        @subject= Subject.new
        @roll=session[:roll_number]
    end
    def edit
        @subject= Subject.find(params[:id])
    end
    def update
        @suj= Subject.new(find_id)
        @subject= Subject.find(@suj.id)
        if @subject.update_attributes(my_params)
            flash[:notice]="Subject Updated"
            redirect_to(:action => 'list')
        else
            render('new')
        end
    end
    def my_params
        params.require(:subject).permit(:name,:position, :visible, :id)
    end
    def find_id
        params.require(:subject).permit(:id)
    end
    def deleteId
        params.require(:subject).permit(:id)
    end
    def create
        @rolln=session[:roll_number]
        @subject= Subject.new(my_params)
        @subject.rollnumber=@rolln
        @temp=Subject.where(:position=>@subject.position)
        if (@temp.count ==0)
            @subject.save
            flash[:notice]="Subject CREATED"
            redirect_to(:action => 'list')
        else
            render('subject_repeat')
        end
    end
    def delete
        @subject= Subject.find(params[:id])
    end
    def destroy
        
            @suj= Subject.new(deleteId)
            @subject=Subject.find(@suj.id)
            if @subject.destroy
                flash[:notice]="Subject DELETED"
                redirect_to(:action => 'list')
            else
                render('new')
            end
        
    end
    def makeAnn
    end
  

end
