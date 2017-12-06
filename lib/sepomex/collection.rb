module Sepomex
  class Collection
    attr_reader :total_pages, :total_objects, :per_page, :collection

    def initialize(attributes = {})
      @total_pages = attributes["total_pages"]
      @total_objects = attributes["total_objects"]
      @per_page = attributes["per_page"]
      @collection = []
    end

    def method_missing(name, *args, &block)
      @collection.send(name, *args, &block)
    end

    def respond_to_missing?
      super
    end
  end
end
