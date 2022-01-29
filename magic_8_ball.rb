#Magic 8 ball desktop application using Ruby GTK library.

require "gtk3"

app = Gtk::Application.new("org.gtk.magic8ball", :flags_none)

app.signal_connect "activate" do |application|
  # new window with title.
  window = Gtk::ApplicationWindow.new(application)
  window.set_title("Magic 8 Ball Simulation")
  window.set_border_width(10)
  window.set_default_size(500,200)

  #Create grid for widgets 
  grid = Gtk::Grid.new
  grid.set_column_spacing(10)
  grid.set_row_spacing(20)

  # Pack the container in the window
  window.add(grid)

  #Add magic 8 ball image to the grid.  
  image = Gtk::Image.new("eight_ball.jpeg")
  grid.attach(image,1 ,1,1,1)

  #Text window to store magic 8 ball result.
  text1 = Gtk::TextView.new
  buffered = text1.buffer
  grid.attach(text1, 1, 0, 1, 1)

  #Button to shake the magic 8 ball.
  button = Gtk::Button.new(:label => "Shake the ball!")
  button.signal_connect("clicked") do |widget|
      
      #Generate all possible outcomes of shaking the magic 8 ball.
      number = rand(1..20)
      case number
      when 1
          buffered.text = "It is certain."
      when 2
          buffered.text = "It is decidedly so."
      when 3
          buffered.text = "Without a doubt."
      when 4
          buffered.text = "Yes definitely."
      when 5
          buffered.text = "You may rely on it."
      when 6
          buffered.text = "As I see it, yes."
      when 7
          buffered.text = "Most likely."
      when 8
          buffered.text = "Outlook good."
      when 9
          buffered.text = "Yes."
      when 10
          buffered.text = "Signs point to yes."
      when 11
          buffered.text = "Reply hazy, try again."
      when 12
          buffered.text = "Ask again later."
      when 13
          buffered.text = "Better not tell you now."
      when 14
          buffered.text = "Cannot predict now."
      when 15
          buffered.text = "Concentrate and ask again."
      when 16
          buffered.text = "Don't count on it."
      when 17
          buffered.text = "My reply is no."
      when 18
          buffered.text = "My sources say no."
      when 19
          buffered.text = "Outlook not so good."
      else
          buffered.text = "Very doubtful."
      end
  end

  #Place the magic 8 ball shake button on the grid.
  grid.attach(button, 0, 0, 1, 1)

  #quit button
  button = Gtk::Button.new(:label => "Quit")
  button.signal_connect("clicked") do |widget|
      window.destroy 
  end

  #Place quit button on the app.
  grid.attach(button, 2, 0, 1, 1)

  #Show all widgets on the app window.
  window.show_all
end

#Run the app
status = app.run([$0] + ARGV)

puts status
