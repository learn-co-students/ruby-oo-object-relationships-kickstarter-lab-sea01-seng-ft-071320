class Backer
  attr_reader :name

  @@all = []

  def initialize(name)
    @name = name

    @@all << self
  end

  def self.all
    @@all
  end

  def back_project(project)
    ProjectBacker.new(project, self)
  end

  def get_pbs
    ProjectBacker.all.select { |pb| pb.backer == self }
  end

  def backed_projects
    get_pbs.reduce([]) { |projects, pb| projects << pb.project }
  end
end