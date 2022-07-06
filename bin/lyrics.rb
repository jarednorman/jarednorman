#!/usr/bin/env ruby

require "date"

STATUSES = [
  "Hope Rides Alone",
  "There's no man or machine who can stop me",
  "There are no heroes left in man",
  "With these hands, we will destroy",
  "With these hands, we will rebuild",
  "Whatever's on the table plays",
  "You can't just set the world at someone else's feet",
  "Here comes the arm",
  "Fear not the task ahead, there's no escaping it",
  "There's no good nor evil here",
  "Freedom doesn't exist",
  "Onward I go once again",
  "Only victory can bring me home",
  "I am the wind that shapes the land",
  "Oceans arise at my command",
  "Politicians lives are like the tide",
  "I've nothing without sacrifice",
  "Fear not your anger",
  "Open wide, embrace the afterlife",
  "I am the master of the Nothing",
  "Vast is the void in us",
  "Look upon the shores of retribution",
  "Immortal blood courses through my veins",
  "The mammoth rider comes",
  "The gods have left me on my own",
  "How heavy this axe",
  "All you know shall cease to be",
  "We do what must be done",
  "All will fall and Earth will die in flame",
  "May the winter's wolves surround you",
  "May the mountains rise against you",
  "May the forests block your path",
  "May your axes chip and shatter",
  "Await your doom at empire's end",
  "Laboring in the liquid light of Leviathan",
  "You will not find us among those who dream of escaping",
  "We ride the warp of space into the womb of night",
  "The bearer of the orb awaits the sacred key",
  "The cord is cut, the way is shut, the orb goes dim",
  "This great nothing is everything",
  "Descend into the voidpit",
  "We are vast unknowable beings",
  "Behind the mask, another mask",
  "We bring ruins to ruins",
  "Raze the grey throne of deep-rooted self annihilation",
  "Assume the God form, seize the hidden shape",
  "We all are bent by unseen burdens",
  "The dead kiss of luxury keeps you a slave",
  "Nothing is ever enough, nor will ever be",
  "Beg to be absolved of adversity",
  "Ce que tout le monde dit doit être vrai",
  "What you do not know cannot hurt you!",
  "Reach high for the gold that is just out of reach"
]

Time.now.tap do |now|
  Random.srand now.yday
  puts STATUSES.shuffle[now.hour % STATUSES.length]
end
