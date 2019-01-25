module Concerns::Findable
  def self.find_by_name(name)
    self.all.detect do |song|
      song.name == name
    end
  end 
  
  def find_or_create_by_name(name)
<<<<<<< HEAD
    # if self.find_by_name(name)
    #   self.find_by_name(name)
    # else
    # song = self.create(name)
    # end

    find_by_name(name) || create(name)
      

=======
    find_by_name(name) || create(name)
>>>>>>> 8fcdab011ae3d6cee526c3981e37d853e9439aa6
  end
end