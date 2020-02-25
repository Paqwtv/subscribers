class V1::Web::ProgramSerializer < ApplicationSerializer
  attributes :title, :description

  attribute :users, if: proc { |_record, params| params && params[:relations] == true } do |obj|
    V1::Web::UserSerializer.new(obj.users.not_banned)
  end
end
