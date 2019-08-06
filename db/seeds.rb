Video.destroy_all
User.destroy_all

def create_serial(title, season_count)
  season_count.times do |season_number|
    Season.new(
      title: "#{title} #{season_number+1}",
      plot: 'fantasía',
    ).tap do |s|
      (1..(5 + rand(5))).map do |i|
        s.episodes.build(video: s, number: i, title: "Episodio #{i}")
      end
      s.purchase_options.build(price: 2.99, video_quality: 'hd')
      s.purchase_options.build(price: 1.99, video_quality: 'sd')
    end.save!
  end
end

create_serial('Ministerio del tiempo', 3)
create_serial('El internado. Laguna Negra', 7)
create_serial('El barco', 3)
create_serial('El pueblo', 1)
create_serial('El hombre de tu vida', 1)

[
  'Todo Sobre Mi Madre',
  'El Laberinto del Fauno',
  'Y Tú Mama También',
  'No Se Aceptan Devoluciones',
  'Aquí Entre Nos',
  'Diarios de Motocicleta'
  ].each do |title|
  Movie.new(title: title, plot: 'comedia').tap do |s|
    s.purchase_options.build(price: 2.99, video_quality: 'hd')
    s.purchase_options.build(price: 1.99, video_quality: 'sd')
  end.save!
end

(1..3).each { |i| User.create(email: "user#{i}@mail.com") }
