class SimpleGoogleCustomSearch::ResultSet
  attr_accessor :total, :item
  
  def initialize(attrs={})
    @total = attrs[:total] || 0
    @item = attrs[:item] || []
  end
  
  def self.create_empty
    self.new({
      total: 0,
      item: []
    })
  end
end