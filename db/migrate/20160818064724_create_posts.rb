class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      
      t.string :type
      t.string :aca
      t.string :day
      t.string :time
      t.string :week
      t.string :title
      t.string :link
      t.string :teacher
      t.string :price
      t.string :level
      
      t.timestamps null: false
    end
  end
end

#과목군 / 레벨 / 학원 / 요일
#과목군 / 학원 / 요일(시간) / 강의명 / url / 강사 / 가격
#type   / aca  / day(time)  / title  / url / teacher / price / level
#week:수업주기, time:수업시간, day:수강시간 - 해커스기준