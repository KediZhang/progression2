# guess_the_number

require 'sinatra'
require 'sinatra/reloader' if development? 

enable :sessions



get '/guess' do
  session['c'] = 0
  num = rand 1...10
  session['num'] = num
  "Guess a number between 1 and 10, you have 5 chances <br/>
  Type your number like '/9' "
end

get '/guess/:number' do
  session['n']=params['number']
  
if session['n'] != session['num'].to_s
    if session['c'] < 5
      session['c'] += 1
    "Your guess #{session['n']} is wrong, let's try again <br/>
    total guess(es) you have tried: "+ session['c'].to_s
    else session['c'] =5
      "Your chances are run out<br/> go '/guess' to play again "
    end
else
  "congratulations, Your guess #{session['n']} is right <br/> go '/guess' to play again"
end
end

