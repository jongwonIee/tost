require 'mailgun'
class HomeController < ApplicationController
  def a_hackers_search_result
    @lectures = Post.all
  end
  
  def index
    @lectures = Post.all
    
    #찜하기 기능
    if params[:type] == "wish"
      current_user.follow(Post.find(params[:lecture_id]))
      redirect_to :back

    elsif params[:type] == "unwish"
      current_user.stop_following(Post.find(params[:lecture_id]))
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
       @address =  params[:address]
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
        new_post = Post.new
        new_post.title = @title
        new_post.content = @content
   #     new_post.email = @address
        new_post.save
        # redirect_to '/abou'
    end
    
    def list
        @every_post = Post.all #Post.all.order("id desc")
    end
end
