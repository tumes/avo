module Avocado
  module Resources
    class Team < Resource
      def initialize
        @title = :name
        @search = [:id, :name]
      end

      fields do
        id
        text :name
        textarea :description, rows: 5, readonly: false, hide_on: :index, format_using: -> (value) { value.to_s.truncate 30 }, required: true, default: 'This team is wonderful!'

        number :members_count do |model|
          model.members.count
        end

        has_one :admin
        has_many :members
      end
    end
  end
end