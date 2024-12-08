class Page < ApplicationRecord
  has_many :results

  validates_presence_of(:url)
  validates_presence_of(:check_type)
  validates_presence_of(:selector)
  validates :match_text, presence: { if: -> { check_type == "text" } }

  def run_check!
    scraper = Scraper.new(url)
    result = case check_type
    when "text"
      scraper.text(selector: selector).downcase == match_text.downcase
    when "exists"
      scraper.present?(selector: selector)
    when "not_exists"
      scraper.present?(selector: selector)
    end
    results.create(success: result)
  end
end
