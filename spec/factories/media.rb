FactoryBot.define do
  factory :medium do
    name { "John Carpenter" }
    original_name { "Dear John" }
    first_air_date { "1961-01-07" }
    profile_path { "/9tjIgkkbajG2zMI4Yk21hpttXv0.jpg" }
    release_date { "2002-01-07" }
    overview { "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce dui libero, pulvinar vel lorem in, ultricies convallis ipsum. Sed malesuada vel leo id dictum. Praesent quis tortor egestas, vestibulum lacus eu, condimentum mi. Mauris volutpat feugiat nibh, vitae volutpat libero fringilla a. Sed quam orci, tempus ac erat sed, facilisis varius quam. Fusce ut lacus porttitor, elementum tellus sed, facilisis orci. Praesent ac elit eget risus commodo tincidunt eu at leo. Sed rutrum dignissim velit, id ornare magna iaculis in." }
    poster_path { "/q6725aR8Zs4IwGMXzZT8aC8lh41.jpg" }
    popularity { 12.9 }
    media_type { "tv" }
  end

  factory :movie, class: "Medium" do
    title { "John Wick" }
    original_title { "John Wick: De Volta ao Jogo" }
    release_date { "2014-10-22" }
    popularity { 50.594 }
    poster_path { "/rboZslo3eQWKBQ3QvlO6wGV0J3K.jpg" }
    overview { "John Wick é um lendário assassino de aluguel aposentado, lidando com o luto após perder o grande amor de sua vida. Quando um gângster invade sua casa, mata seu cachorro e rouba seu carro, ele é forçado a voltar à ativa e inicia sua vingança." }
    media_type { "movie" }
  end

  factory :tv, class: "Medium" do
    name { "Querido John" }
    original_name { "Dear John" }
    first_air_date { "2020-01-02" }
    popularity { 2.1 }
    poster_path { "/rboZslo3eQWKBQ3QvlO6wGV0J3K.jpg" }
    overview { "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce dui libero, pulvinar vel lorem in, ultricies convallis ipsum. Sed malesuada vel leo id dictum. Praesent quis tortor egestas, vestibulum lacus eu, condimentum mi. Mauris volutpat feugiat nibh, vitae volutpat libero fringilla a. Sed quam orci, tempus ac erat sed, facilisis varius quam. Fusce ut lacus porttitor, elementum tellus sed, facilisis orci. Praesent ac elit eget risus commodo tincidunt eu at leo. Sed rutrum dignissim velit, id ornare magna iaculis in." }
    media_type { "tv" }
  end

  factory :person, class: "Medium" do
    name { "John Carpenter" }
    profile_path { "/rboZslo3eQWKBQ3QvlO6wGV0J3K.jpg" }
    popularity { 22.0 }
    media_type { "person" }
  end
end
