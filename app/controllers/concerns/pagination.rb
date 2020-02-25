module Pagination
  extend ActiveSupport::Concern

  def pagination_options(collection)
    {
      meta: {
        total_pages: collection.total_pages,
        total_entries: collection.total_entries
      },
      links: {
        self: collection.current_page,
        next: collection.next_page,
        prev: collection.previous_page
      }
    }
  end
end
