get '/' do
  erb :index
end

post '/' do
  @word = params[:word]
  begin
    valid_input(@word)
    redirect "/anagrams/#{@word}"
  rescue Exception => error
    @error = error.message
    erb :index
  end
end

get '/anagrams/:word' do
  @word = params[:word]
  alphabetized_string = @word.chars.sort.join
  @anagrams = Word.where("letters=?", alphabetized_string)
  erb :show
end

def valid_input(input)
  letter_array = input.chars
  unique_letters = letter_array.uniq
  if input.length > 3
    raise Exception.new("Word must be less than or equal to 3 characters.")
  elsif unique_letters.length < letter_array.length
    raise Exception.new("Word must have unique characters")
  end
end
