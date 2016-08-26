require 'rubygems'
require 'mechanize'
class Hacker < ActiveRecord::Base
    
    acts_as_followable #지우면꿀밤
    
    def self.hackers_toefl
      1.upto(2) do |loc|
        1.upto(7) do |n|
          1.upto(4) do |l|
            1.upto(4) do |c|
              agent = Mechanize.new
              if loc == 1
                page = agent.get"http://www.hackers.ac/site/?st=lecture&idx=201&no=1&loc=#{loc}&new_level[]=#{n}&lesson_week[]=#{l}&completion_term[]=#{c}"
              elsif loc == 2
                page = agent.get"http://www.hackers.ac/site/?st=lecture&idx=201&no=11&loc=#{loc}&new_level[]=#{n}&lesson_week[]=#{l}&completion_term[]=#{c}"
              end
                list = page.search("td").map(&:text)
                  list.each_slice(7).map.with_index do |x,i|
                      link = page.search("td p a")[i]
                			  Hacker.create(
                			              loc: loc,
                			              subject: 1,
                			              name: 1,
                			              price: x[3].split(" ").last,
                			              link: link['href'],
                			              day:x[1],
                			              time: c,
                			              week: l,
                			              title: x[0],
                			              teacher: x[2],
                			              level: n
                			              )
                  end
            end
          end
        end
      end
    end
    
    def self.hackers_toeic
      1.upto(2) do |loc|
        1.upto(7) do |n|
          1.upto(4) do |l|
            1.upto(4) do |c|
              agent = Mechanize.new
              if loc == 1
                page = agent.get"http://www.hackers.ac/site/?st=lecture&idx=201&no=2&loc=#{loc}&new_level[]=#{n}&lesson_week[]=#{l}&completion_term[]=#{c}"
              elsif loc == 2
                page = agent.get"http://www.hackers.ac/site/?st=lecture&idx=201&no=12&loc=#{loc}&new_level[]=#{n}&lesson_week[]=#{l}&completion_term[]=#{c}"
              end
                list = page.search("td").map(&:text)
                  list.each_slice(7).map.with_index do |x,i|
                    link = page.search("td p a")[i]
                			  Hacker.create(
                			              loc: loc,
                			              subject: 2,
                			              name: 1,
                			              price: x[3].split(" ").last,
                			              link: link['href'],
                			              day:x[1],
                			              time: c,
                			              week: l,
                			              title: x[0],
                			              teacher: x[2],
                			              level: n
                			              )
                  end
            end
          end
        end
      end
    end
    
    def self.hackers_toes
      1.upto(2) do |loc|
        1.upto(7) do |n|
          1.upto(4) do |l|
            1.upto(4) do |c|
              agent = Mechanize.new
              if loc == 1
                page = agent.get"http://www.hackers.ac/site/?st=lecture&idx=201&no=4&loc=#{loc}&bigpart%5B%5D=%25%C5%E4%C0%CD%BD%BA%C7%C7%C5%B7%25&new_level[]=#{n}&lesson_week[]=#{l}&completion_term[]=#{c}"
              elsif loc == 2
                page = agent.get"http://www.hackers.ac/site/?st=lecture&idx=201&no=14&loc=#{loc}&bigpart%5B%5D=%25%C5%E4%C0%CD%BD%BA%C7%C7%C5%B7%25&new_level[]=#{n}&lesson_week[]=#{l}&completion_term[]=#{c}"
              end
                list = page.search("td").map(&:text)
                  list.each_slice(7).map.with_index do |x,i|
                      link = page.search("td p a")[i]
                			  Hacker.create(
                			              loc: loc,
                			              subject: 3,
                			              name: 1,
                			              price: x[3].split(" ").last,
                			              link: link['href'],
                			              day:x[1],
                			              time: c,
                			              week: l,
                			              title: x[0],
                			              teacher:x[2],
                			              level: n
                			              )
                  end
            end
          end
        end
      end
    end
end