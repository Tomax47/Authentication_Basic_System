json.extract! blogpost, :id, :title, :aouther, :content, :publish_date, :created_at, :updated_at
json.url blogpost_url(blogpost, format: :json)
