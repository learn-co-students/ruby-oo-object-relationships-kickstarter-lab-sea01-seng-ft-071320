class Project
    attr_reader :title

    def initialize(title)
        @title = title
    end

    def add_backer(backer)
        ProjectBacker.new(self, backer)
    end

    def backers
        new = ProjectBacker.all.select {|pro| pro.project == self}
        new.map {|pro| pro.backer}
    end
end