class PostController < ApplicationController
  def index
    
    # If no date is in the querystring then we use the current date
    if params[:datefilter] == nil
      # Show the post from the current month and year order by descending
      @posts = Post.where ( ["month = ? and year = ?" , Date.today.month , Date.today.year])
      
    else
      # parse the date in the params
      yearFilter = params[:datefilter][0..3].to_i
      monthFilter = params[:datefilter][4..5].to_i
      
      @posts = Post.where ( ["month = ? AND year = ?" , monthFilter , yearFilter])
      
    end
    
    
  end
  
  
  def new
    
  end
  
  
  def addpost
    bodytext = params[:postbody]
    username = params[:name]
    
    if username == nil || username = ""
      username = "Anonymous"  
    end
    
    
    newPost = Post.new
    newPost.body = bodytext
    newPost.name = username
    newPost.month = Date.today.month
    newPost.year = Date.today.year
    newPost.save!
    
    
    # Update the number of post for the month
    # Check if the month and year exist first
    
    dcount = Postdatecount.where( ["month = ? AND year = ?" , Date.today.month , Date.today.year])
    
    if dcount.size > 0
      # If exist, then we add to the count
      dateCount = Postdatecount.where ( ["month = ? AND year = ?" , Date.today.month , Date.today.year ])
      dateCount = dateCount.first
      dateCount.postcount = dateCount.postcount + 1 
      dateCount.save!
      
    else  
    # If does not exist, then we insert the month and add count as 1
      newDateCount = Postdatecount.new
      newDateCount.month = Date.today.month
      newDateCount.year = Date.today.year
      newDateCount.postcount = 1
      newDateCount.save!
    end

    redirect_to root_path
    
  end
end
