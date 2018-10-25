json.extract! diary, :id, :title, :subtitle, :pages, :month, :created_at, :updated_at
json.url diary_url(diary, format: :json)
