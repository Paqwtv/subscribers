class V1::Web::UserSerializer < ApplicationSerializer
  attributes :name, :email

  attribute :programs, if: proc { |_record, params| params && params[:relations] == true } do |obj|
    V1::Web::ProgramSerializer.new(obj.programs)
  end
end
