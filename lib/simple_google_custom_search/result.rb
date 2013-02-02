class SimpleGoogleCustomSearch::Result
  attr_accessor :title, :link, :description
  
  def initialize(attrs={})
    @title = attrs[:title] || ''
    @link = attrs[:link] || ''
    @description = attrs[:description] || ''
  end
end