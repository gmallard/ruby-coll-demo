#
# == Ruby Collection Demonstration
#
# This project shows how to implement a Ruby collection by:
#
# 1. Defining a collection element type that mixes-in Comparable
# 2. Defining a collection that mixes-in Enumerable
#
# The collection element and collection type shown here are of no practical
# value.
#
# The intent is to show how little code must be written in order to get back a 
# large amount of functionality from the mix-ins.
#
# === Tests
#
# Simple tests are provided for:
#
# * All methods provided by the Comparable mix-in
# * All methods provided by the Enumerable mix-in
#
# Code has been tested using:
#
# * ruby 1.8.7 (2010-01-10 patchlevel 249) [i486-linux]
# * ruby 1.9.0 (2008-10-04 revision 19669) [i486-linux]
# * ruby 1.9.1p378 (2010-01-10 revision 26273) [i486-linux]
# * ruby 1.9.2p0 (2010-08-18 revision 29034) [i686-linux]
#
# Note: all tests can be run with only the 'minitest' gem required.  This gem
# is automatically installed in 1.9.2.
#
# === Documentation
#
# A script is provided to generate +rdoc+ for the project.
#
# === Ruby 1.9+
#
# As of Feb 28, 2010 additional Enumerable methods in ruby 1.9 are also
# demonstrated.  Ruby 1.8 compatability is maintained.
#
# === Ruby 1.9.2 Specifics
#
# As of Sep 16, 2010 additional Enumerable methods in ruby 1.9.2 are also
# minimally demonstrated.  Additinonal tests need to be developed for:
#
# * each_entry
# * slice_before
#
# === Clarifications
#
# As of Sep 12, 2010 the class used as a data element and the collection
# have changed in order to clarify and simplify the example.
#
# === The showmethods.rb Utility
#
# Readers are cautioned about the output of this utility with various Ruby
# releases and levels.  For example, when run using the author's 1.8.7
# system, several methods are listed which have _not_ been carried forward
# to the 1.9.x environment(s).
#
# === Enumerable Methods
#
# * all? (1.8)
# * any? (1.8)
# * collect (1.8)
# * count (1.9)
# * cycle (1.9)
# * detect - (1.8)
# * drop (1.9)
# * drop_while (1.9)
# * each_cons (1.9)
# * each_slice (1.9)
# * each_with_index (1.8 and 1.9-delta)
# * each_with_object (1.9)
# * entries (1.8 and 1.9-delta) (Syn to_a)
# * find (1.8) (Syn detect)
# * find_all (1.8) (Syn select)
# * find_index (1.9)
# * first (1.9)
# * grep (1.8)
# * group_by (1.9)
# * include? (1.8) (Syn member)
# * inject (Syn reduce) (1.8 and 1.9-delta)
# * map (Syn collect)
# * max (1.8)
# * max_by (1.9)
# * member (1.8) (Syn include?)
# * min (1.8)
# * min_by (1.9)
# * minmax (1.9)
# * minmax_by (1.9)
# * none? (1.9)
# * one? (1.9)
# * partition (1.8)
# * reduce (1.9) (Syn inject) 
# * reject (1.8)
# * reverse_each (1.9)
# * select (1.8) (Syn find_all)
# * sort (1.8)
# * sort_by (1.8)
# * take (1.9)
# * take_while (1.9)
# * to_a (1.8 and 1.9-delta) (Syn entries)
# * zip (1.8)
#
# The following methods added in 1.9.2 are:
#
# * chunk
# * collect_concat (Syn flat_map)
# * each_entry
# * flat_map (Syn collect_concat)
# * slice_before
#
# == Author
#
# Guy Allard
#
# == Copyright
#
# Copyright (c) 2009, 2010 Guy Allard
# Licensed under the same terms as Ruby.  No warranty is provided.
#

