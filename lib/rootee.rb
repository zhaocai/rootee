#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
# ============== = ===========================================================
# FileName       : rootee
# Description    : Project Root Path Finder
# Author         : Zhao Cai <caizhaoff@gmail.com>
# HomePage       : https://github.com/zhaocai/rootee
# Version        : 0.1
# Date Created   : Fri 22 Mar 2013 11:09:31 PM EDT
# Last Modified  : Fri 22 Mar 2013 11:27:47 PM EDT
# Tag            : [ ruby, project, path ]
# Copyright      : © 2013 by Zhao Cai,
#                  Released under current GPL license.
# ============== = ===========================================================

require 'pathname'

class Rootee
  VERSION = "1.0.0"

  attr_accessor :marker
  attr_accessor :end_path

  def initialize(end_path=[], marker=[] )
    @marker = [
      {
        :dir => ['.git/', '.svn/', '_darcs/', '.hg/', '.bzr/', 'nbproject/']
      },
      {
        :file => ['./Makefile', './configure', './Rakefile',
                  './NAnt.build', './build.xml', './prj.el',
                  './pom.xml', './Gemfile', './Thorfile'],
      },
      {
        :file => ['../project', './tags', './gtags'],
        :dir  => ['bin/', 'src/', 'include/', 'lib/', 'doc/', ],
      },
    ] if marker.empty?


    home = Pathname.new(ENV['HOME'])
    @end_path = end_path.empty? ? [ "/", home.realpath, ] : end_path
  end


  def find_root(start_path=Dir.getwd)
    root = start_path
    is_find = false

    @marker.each { |m|
      m.each { |type, filter|

        Dir.chdir(start_path)
        # upwards traverse
        while ! end_path.include?(Dir.getwd)
          glob_ret = Dir.glob(filter).select { |fn|
            if type == :file
              File.file?(fn)
            elsif type == :dir
              File.directory?(fn)
            end
          }

          unless glob_ret.empty?
            is_find = true
            root = Dir.getwd
            break
          end
          Dir.chdir('..')
        end
      }

      break if is_find
    }

    Dir.chdir(start_path)
    return is_find, root
  end


end



