require 'builder'

xml = Builder::XmlMarkup.new(:indent => 2)
xml.person {
  xml.name("Neo")
  xml.catch_phrase("Whoa")
  xml.class("pod-born")
}
puts xml.target!

