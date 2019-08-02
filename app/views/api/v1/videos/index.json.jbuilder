json.records @videos, partial: 'video', as: :video
json.partial! 'shared/pagination', pagination: @videos