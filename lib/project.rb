class Project
  attr_reader :title

  @@all = []

  def initialize(title)
    @title = title

    @@all << self
  end

  def self.all
    @@all
  end

  def add_backer(backer)
    ProjectBacker.new(self, backer)
  end

  def get_pbs
    ProjectBacker.all.select { |pb| pb.project == self }
  end

  def backers
    get_pbs.reduce([]) { |backers, pb| backers << pb.backer }
  end
end