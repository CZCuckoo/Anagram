get '/words' do
  @words = Word.all
  erb :"/words/index"
end

get '/words/:id' do
  label = params[:id]
  @word = Word.find(label)
  erb :"/words/show"
end
