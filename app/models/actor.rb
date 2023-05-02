# == Schema Information
#
# Table name: actors
#
#  id         :integer          not null, primary key
#  bio        :text
#  dob        :date
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Actor < ApplicationRecord
  #direct association
 has_many(:characters)
  # def characters
  #   key = self.id

  #   the_many = Character.where({ :actor_id => key })

  #   return the_many
  # end
# has_many(:filmography, {:class_nmae => "Movie", :foreign_key => "movie_id"}


# indirect association
#this will not work unless we define the direct associatiuons first
  # def filmography
  #   #creteed blank array
  #   the_many = Array.new
  #   #used the .characters method and loop through each characcter
  #   self.characters.each do |joining_record|
  #     #this will get the cooresponding movie
  #     destination_record = joining_record.movie
  #     #push the movie into the blank array
  #     the_many.push(destination_record)
  #   end
  #     #retur the array
  #   return the_many
  # end

  # searching and filtering gem ransack

  has_many(:filmography, {
    :through => :characters,
    :source => :movie
  })

  #another indirect method
  # has_many(:directors, {
  #   :through => :filmography,
  #   :source => :director
  # })

end
