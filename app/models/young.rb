class Young < ActiveRecord::Base
    
        acts_as_followable #지우면꿀밤
        
    def self.young
        agent = Mechanize.new
        # 92500.upto(92999) do |n|
        92500.upto(92999) do |n|
            page = agent.get"http://offeng.dangi.co.kr/m/registration/main/view?saleinfo_id=#{n}"
            title = page.search("p.lec_tit").map(&:text)
            list = page.search("dd").map(&:text)
            subject = 0
            level = 0
            week = 0
            if title[0].include? "토플"
                subject = 1
            end
            
            if title[0].include? "60" or title[0].include? "80"
                level = 1
            elsif title[0].include? "90"
                level = 2
            elsif title[0].include? "100" or title[0].include? "실전"
                level = 3
            end
            
            if title[0].include? "토익"
                subject = 2
            end
            
            if title[0].include? "700"
                level = 1
            elsif title[0].include? "800"
                level = 2
            elsif title[0].include? "900"
                level = 3
            end
            
            if title[0].include? "토스" or title[0].include? "토익스피킹"
                subject = 3
            end
            
            if title[0].include? "토스" or title[0].include? "토익스피킹"
                level = 1
            end
            
            if list[2].include? "월,화,수"
                week = 1
            elsif list[2].include? "월,수,금"
                week = 2
            elsif list[2].include? "화,목,금"
                week = 3
            elsif list[2].include? "토" or list[2].include? "일"
                week = 4
            end
            
            			  Young.create(
            			              loc: 1,
            			              subject: subject,
            			              name: 4,
            			              price: list[4],
            			              link: n,
            			              day: list[2] + list[3],
            			             # time: ,
            			              week: week,
            			              title: title[0],
            			              teacher: list[0],
            			              level: level
            			              )
        end
    end
end