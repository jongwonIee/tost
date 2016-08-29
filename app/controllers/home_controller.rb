require 'mailgun'
class HomeController < ApplicationController
  
  def index
  end
  
  def index_all
    @hackers = Hacker.all
    @young = Young.all
    
    #찜하기 기능-해커스
    if params[:type] == "hacker_wish"
      current_user.follow(Hacker.find(params[:lecture_id]))
      redirect_to :back

    elsif params[:type] == "hacker_unwish"
      current_user.stop_following(Hacker.find(params[:lecture_id]))
      redirect_to :back
    end
    
    # #찜하기 기능-영단기
    if params[:type] == "young_wish"
      current_user.follow(Young.find(params[:lecture_id]))
      redirect_to :back

    elsif params[:type] == "yooung_unwish"
      current_user.stop_following(Young.find(params[:lecture_id]))
      redirect_to :back
    end
    
  end
  
  def index_result
    if params[:level] == 1 or params[:level] == 2 or params[:level] == 3
      level = 1
    elsif params[:level] == 4 or params[:level] == 5
      level = 2
    else
      level = 3
    end
    @filtered_hackers = Hacker.where("subject In (?) and loc In (?) and week In (?) and level In (?)",
    params[:subject], params[:loc], params[:week], level)
    
    @filtered_young = Young.where("subject In (?) and loc In (?) and week In (?) and level In (?)",
    params[:subject], params[:loc], params[:week], level)
    
    
    #찜하기 기능
    if params[:type] == "hacker_wish"
      current_user.follow(Hacker.find(params[:lecture_id]))
      redirect_to :back

    elsif params[:type] == "hacker_unwish"
      current_user.stop_following(Hacker.find(params[:lecture_id]))
      redirect_to :back
    end
    
    
    if params[:type] == "young_wish"
      current_user.follow(Young.find(params[:lecture_id]))
      redirect_to :back

    elsif params[:type] == "young_unwish"
      current_user.stop_following(Young.find(params[:lecture_id]))
      redirect_to :back
    end
    
    # redirect_to "/home/index_result"
    
  end
  
  def user_page
    @hackers = Hacker.all
    @young = Young.all
    
    #찜하기 기능
    if params[:type] == "hacker_wish"
      current_user.follow(Hacker.find(params[:lecture_id]))
      redirect_to :back

    elsif params[:type] == "hacker_unwish"
      current_user.stop_following(Hacker.find(params[:lecture_id]))
      redirect_to :back
    end
    
    if params[:type] == "young_wish"
      current_user.follow(Young.find(params[:lecture_id]))
      redirect_to :back

    elsif params[:type] == "young_unwish"
      current_user.stop_following(Young.find(params[:lecture_id]))
      redirect_to :back
    end
    
    
  end
    
  # def about
  #   @title = params[:title]
  #   @receiver = params[:email]
  #   @content = params[:content]s
  #   mg_client = Mailgun::Client.new("key-5c1dde76bef60438458d6afe28c6405c") #메일보내기
  #                     message_params =  {
  #                                       from: "jiyoni1225@gmail.com",
  #                                       to: "jiyoni1225@gmail.com",
  #                                       subject: @title,
  #                                       text: @content
                      
  #                     result = mg_client.send_message('sandbox0483375709ed4b5aa15e77d809433a11', message_params).to_h!
                      
  #                     message_id = result['id']
  #                     message = result['message']
    
    
  # end
      def write
        @title = params[:title]
        
        @receiver =  params[:email]
        @content = params[:content]
        mg_client = Mailgun::Client.new("key-5c1dde76bef60438458d6afe28c6405c")
        message_params =  {
                          from: 'YOJINI@love.com',
                          to: 'jiyoni1225@gmail.com',
                       #   to:   @address,
                          subject: @title,
                          text:    @content
                          }
        result = mg_client.send_message('sandbox0483375709ed4b5aa15e77d809433a11.mailgun.org', message_params).to_h!
        message_id = result['id']
        message = result['message']
        # new_post = Post.new
        # new_post.title = @title
        # new_post.content = @content
   #     new_post.email = @address
        # new_post.save
        redirect_to '/about'
    end
    
    def list
        @every_post = Post.all #Post.all.order("id desc")
    end
end
