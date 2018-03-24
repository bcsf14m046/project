class AnnouncementController < ApplicationController
  layout 'admin'
  def create
    @position=session[:position]
    
    @instructor=  session[:roll_number]
    @rolln=session[:subject_name]
    @announcement=Announcement.new(my_params)
    @announcement.Subject_ID=@rolln
    @announcement.instructor=@instructor
    @announcement.position=@position
  
    if @announcement.save
      redirect_to(:controller => 'subjects', :action => 'list')
    else
      redirect_to(:action => 'new')
    end
  end
  def my_params
    params.require(:announcement).permit(:Announcements)
  end
  def show
    @temp=params[:id]
    @req=Student.where(:Subject_ID=>@temp)
    
  end
  def showstd
    @tm=params[:id]
    
    @std=Stdlist.where(:Subject_ID=>@tm)
  end
  def remove_from_subject_list
    @temp=params[:id]
    @std_list=Stdlist.find(@temp)
   
    if(@std_list)
      @std_list.destroy
      redirect_to(:controller => 'announcement', :action => 'showstd')
    else
      redirect_to(:controller => 'announcement', :action => 'not_removed')
    end
  end
  def show1
    @temp=(params[:subject_id])
    @temp1=(params[:us])
    
    @std=Stdlist.new()
    @std.Subject_ID=@temp
    @std.Rollnumber=@temp1
    @rollnumber=session[:roll_number]
    @std.instructor=@rollnumber
    
    if @std.save
      @dlt=Student.find_by_Subject_ID(@temp)
      
      if @dlt.destroy
        redirect_to(:controller => 'announcement', :action => 'show')
      else
      end
    else
      redirect_to(:controller => 'subjects', :action => 'list')
    end
  end

end
