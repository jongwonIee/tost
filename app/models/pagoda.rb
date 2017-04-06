class Pagoda < ActiveRecord::Base
    
    acts_as_followable #지우면꿀밤
    
    def self.toefl
        agent = Mechanize.new
          ["PAI02","JCF01","SHG01","PSJ19","ABN01","CES02","JIM02","LAR06",                 #강남토플
          "CWS05","KIS03","PHS07","PSR01","JJK10",                                          #종로토플
          "KCY10","PJW08","YHY03","YJY14","KMJ22","KMJ40","LJW16","SYH11"]                  #신촌토플     
          .each do |i| 
            page = agent.get"http://m.pagoda21.com/speaker/detail/#{i}?popup=Y"
            list = page.search("td").map(&:text)
            list.each_slice(6) do |x|
            
            week = 0
            loc = 0
            subject = 1
            level = 0
            
            
            if x[0].include? "주5일" or x[0].include? "2주반"
                week = 1
            elsif x[0].include? "월수금"
                week = 2
            elsif x[0].include? "화목금"
                week = 3
            elsif x[0].include? "토" or x[0].include? "일" or x[0].include? "주말"
                week = 4
            end
            
            if x[1] == "강남"
                loc = 1
            elsif x[1] == "종로"
                loc = 2
            elsif x[1] == "신촌"
                loc = 3
            end
            
            if x[2].include? "70" or x[2].include? "80" or x[2].include? "기초"
                level = 1
            elsif x[2].include? "90" or x[2].include? "유형"
                level = 2
            elsif x[2].include? "100" or x[2].include? "실전" or x[2].include? "컴퓨터"
                level = 3
            end
            
            #link관련식 수정
                
                if Pagoda.exists?(day: x[0], title: x[2], teacher: x[3], price: x[4])
                else
            			  Pagoda.create(
            			              loc: loc,
            			              subject: subject,
            			              name: 2,
            			              level: level,
            			              week: week,
            			              price: x[4],
            			              link: i,
            			              day: x[0],
            			             # time: ,
            			              title: x[2],
            			              teacher: x[3]
            			              )
            	end
            end    			     
          end
    end
    
    def self.toeic
        agent = Mechanize.new
          ["KMJ23","PJH19","PHH02","CSA05","JJH17","PHJ11","HSR03","WKJ01","JYR05","RSJ01","KIS02","KYW02","CKW01","YHY04","LEY05","JKK05",   #강남토익
          "CJA04","GWS01","PJY13","ISH03","NJY09","KYH27","YJA04","CYK14","KEY10","KES08","SYA02","KSW06",                                        #종로토플
          "HYG02","SEJ06","KWT01","YJH21","JJY06","SJM10","KJH72","LBR01","CSB01","KHY11","KMJ41","KSY54","JSY06","KIS02","WHJ02","JJY18","YJH21"]#신촌토익     
          .each do |i|        
            page = agent.get"http://m.pagoda21.com/speaker/detail/#{i}?popup=Y"
            list = page.search("td").map(&:text)
            list.each_slice(6) do |x|
            
            week = 0
            loc = 0
            subject = 2
            level = 0
            
            
            if x[0].include? "주5일" or x[0].include? "2주반" or x[0].include? "특별반"
                week = 1
            elsif x[0].include? "월수금"
                week = 2
            elsif x[0].include? "화목금"
                week = 3
            elsif x[0].include? "토" or x[0].include? "일" or x[0].include? "주말"
                week = 4
            end
            
            if x[1] == "강남"
                loc = 1
            elsif x[1] == "종로"
                loc = 2
            elsif x[1] == "신촌"
                loc = 3
            end
            
            if x[2].include? "600" or x[2].include? "650" or x[2].include? "700" or x[2].include? "750" or x[2].include? "기초"
                level = 1
            elsif x[2].include? "800" or x[2].include? "850" or x[2].include? "유형" or x[2].include? "핵" or x[2].include? "완성"
                level = 2
            elsif x[2].include? "900" or x[2].include? "실전"
                level = 3
            end
            
            #link관련식 수정
            
                if Pagoda.exists?(day: x[0], title: x[2], teacher: x[3], price: x[4])
                else
            			  Pagoda.create(
            			              loc: loc,
            			              subject: subject,
            			              name: 2,
            			              level: level,
            			              week: week,
            			              price: x[4],
            			              link: i,
            			              day: x[0],
            			             # time: ,
            			              title: x[2],
            			              teacher: x[3]
            			              )
            	end
            end    			     
          end
    end
    
    def self.toes
        agent = Mechanize.new
          ["KSR09","LHS20","JSH20","RYS01",   #강남토스
          "MSW03","SEJ07","KAN07",            #종로토스 
          "LJH33","PEM01","KSA04"]            #신촌토스  
          .each do |i|        
            page = agent.get"http://m.pagoda21.com/speaker/detail/#{i}?popup=Y"
            list = page.search("td").map(&:text)
            list.each_slice(6) do |x|
            
            week = 0
            loc = 0
            subject = 3
            level = 0
            
            
            if x[0].include? "주5일" or x[0].include? "2주반"
                week = 1
            elsif x[0].include? "월수금"
                week = 2
            elsif x[0].include? "화목금"
                week = 3
            elsif x[0].include? "토" or x[0].include? "일" or x[0].include? "주말"
                week = 4
            end
            
            if x[1] == "강남"
                loc = 1
            elsif x[1] == "종로"
                loc = 2
            elsif x[1] == "신촌"
                loc = 3
            end
            
            if x[2].include? "5~6" or x[2].include? "기초"
                level = 1
            elsif x[2].include? "6~7" or x[2].include? "Lv.6" or x[2].include? "유형"
                level = 2
            elsif x[2].include? "Lv.7" or x[2].include? "실전"
                level = 3
            end
            
            #link관련식 수정
                
                if Pagoda.exists?(day: x[0], title: x[2], teacher: x[3], price: x[4])
                else
            			  Pagoda.create(
            			              loc: loc,
            			              subject: subject,
            			              name: 2,
            			              level: level,
            			              week: week,
            			              price: x[4],
            			              link: i,
            			              day: x[0],
            			             # time: ,
            			              title: x[2],
            			              teacher: x[3]
            			              )
            	end
            end    			     
          end
    end
end