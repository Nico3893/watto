class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index
    true
  end

  end
  def create?
    true
  end
end
