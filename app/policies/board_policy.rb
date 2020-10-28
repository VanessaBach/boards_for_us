class BoardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
    def new?
      true
    end

    def create?
      new?
    end
  end
end
