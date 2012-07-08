# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
require 'faye'
require 'faye/redis'

use Faye::RackAdapter, :mount      => '/faye',
                       :timeout    => 25,
                       :engine => {
                          :type => Faye::Redis,      
                          :host => 'koi.redistogo.com',
                          :port => '9552',     
                          :password => '18f169bf129c3e7120d5e1a27035c038',
                          :database => 1
                        }

run Privatepub::Application