require 'pry'
class Backer
    attr_reader :name
    def initialize (name)
        @name = name
    end

    def back_project(project)
        ProjectBacker.new(project, self)
    end

    def backed_projects
       new = ProjectBacker.all.select {|pro| pro.backer == self}
       new.map {|pro| pro.project}
    end
end