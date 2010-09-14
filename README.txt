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
# The intent is to show how little must be done in order to get back a large
# amount of functionality from the mix-ins.
#
# === Tests
#
# Simple tests are provided for:
#
# * All methods provided by the Comparable mix-in
# * All methods provided by the Enumerable mix-in
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
# === Clarifications
#
# As of Sep 12, 2010 the class used as a data element and the collection
# have changed in order to clarify and simplify the example.
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
# The following methods added in 1.9.2 are TBD:
#
# * chunk
# * collect_concat
# * each_entry
# * flat_map
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

