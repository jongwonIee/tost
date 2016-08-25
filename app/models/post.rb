require 'rubygems'
require 'mechanize'
class Post < ActiveRecord::Base
    
    acts_as_followable
    
    def self.hackers_db
        
        new_level = ["기초","필수","입문","기본","중급","정규","실전"]
        lesson_week = ["주 5일반", "월수금반", "화목금반", "주말반"]
        completion_term = ["아침", "오전", "오후", "저녁"]
    
        1.upto(7) do |n|
          1.upto(4) do |l|
            1.upto(4) do |c|
              agent = Mechanize.new
              page = agent.get"http://www.hackers.ac/site/?st=lecture&idx=201&no=2&loc=1&new_level[]=#{n}&lesson_week[]=#{l}&completion_term[]=#{c}"
              list = page.search("p").map(&:text)
              list.drop(7).reverse.drop(7).reverse.each do |x|
                list2 = page.search("font.b01001002").map(&:text)
                
                list2.values_at(* list2.each_index.select {|i| i.even?}).each do |y|
                  list2.values_at(* list2.each_index.select {|i| i.odd?}).each do |z|
                    # page.link_with(:href => '/site') do |link|
                    aca = "해커스"

                        if x == nil
        
                        else
                            
                			  Post.create(
                			             # lec_id: 
                			             # type: type,
                			              aca: aca,
                			             # price: price,
                			             # link: link,
                			              day:y,
                			              time: completion_term[c-1],
                			              week: lesson_week[l-1],
                			              title: x,
                			              teacher:z,
                			              level: new_level[n-1],
                			              )
                      	end
              			              
          		    
                    # end
                  end    
               end
              end
            end
          end
        end
    end
end