require "tilt/erubis"
require "sinatra"
require "sinatra/reloader" if development?

before do
  @contents = File.readlines('data/toc.txt')
end

helpers do

  def create_paragraphs(text)
    text.split("\n\n").each_with_index.map do |line, index|
      "<p id='#{index}'>#{line}</p>"
    end.join
  end

  def mark_search(text, search_text)
    text.gsub(search_text, "<strong>#{search_text}</strong>")
  end
end

get "/" do
  @title = "The Adventures of Sherlock Holmes"

  erb :home
end

get "/chapters/:number" do
  chapter_number = params[:number]
  chapter_title = @contents[params[:number].to_i - 1]

  @title = "Chapter #{chapter_number} | #{chapter_title}"
  @chapter = File.read("data/chp#{params[:number]}.txt")

  erb :chapter
end

get "/search" do
  if params[:query]
    @results = @contents.each_with_index.each_with_object([]) do |(chapter, index), results|
      text = File.read("data/chp#{index + 1}.txt")
      paragraphs = text.split("\n\n")
      paragraphs.each_with_index do |paragraph, paragraph_index|
        if paragraph.include?(params[:query])
          results << [chapter, index, paragraph, paragraph_index]
        end
      end
    end
  end
  erb :search
end

not_found do
  redirect "/"
end
