class StudentController < ApplicationController
 layout 'admin'
  def create
    
  

    
    @subjects=Subject.order("subjects.position ASC")
  end
  def show
    
    @std=Student.new();
    @std.Subject_ID=params[:id]
    @std.User=session[:roll_number];
    @temp=Student.where(:Subject_ID=>@std.Subject_ID , :User=>@std.User)
    @temp1=Stdlist.where(:Subject_ID=>@std.Subject_ID , :Rollnumber=>@std.User)
    
    if( @temp.count==0 && @temp1.count==0 )
      @std.save
      redirect_to(:action => 'create')
    elsif (@temp1.count!=0)
      redirect_to(:action => 'added')
    else
        redirect_to(:action => 'pending')
    
    end
  end
  def show_subject
    @rollumber=session[:roll_number]
    @temp=Stdlist.where(:Rollnumber=>@rollumber)
  end
  def search_by_instructor
  
    @temp=Subject.new(my_params)
    @subject=Subject.where(:rollnumber=>@temp.rollnumber)
  end
  def search_by_code
    
      @temp=Subject.new(my_code)
      @subject=Subject.where(:position=>@temp.position)
    end
  def my_params
    params.require(:subject).permit(:rollnumber)
  end
  def my_code
    params.require(:subject).permit(:position)
  end
  def subject_detail
    @id=params[:id]
    @stdlist=Stdlist.find(@id)
    
    @subject=Subject.where(:position=>@stdlist.Subject_ID)
    
    @announcement=Announcement.where(:position=>@subject[0].position)
    
  
  end
  def delete_subject_student
    @rollnumber=session[:rollnumber]
    @subject_id=params[:id];
    @subject=Stdlist.find(@subject_id)
    @subject.destroy
    
    redirect_to(:action => 'show_subject')
  end
end
