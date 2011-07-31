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
# * ruby 1.9.2p136 (2010-12-25 revision 30363) [x86_64-linux]
# * And a variety of other Ruby builds.....
#
# Note: Tests will currently fail for Ruby versions less than 1.8.7.  To
# understand why examine the various 'enum_methods*.txt' files and also the 
# documentation for individual Ruby releases. (*TODO* -fix this.)
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
# For a list of methods provided by the Enumerable mixin in various levels of
# Ruby, see the files:
#
# * enum_methods_185_p231.txt
# * enum_methods_186_p383.txt
# * enum_methods_187_p000.txt
# * enum_methods_187_p299.txt
# * enum_methods_191_p378.txt
# * enum_methods_192_p188.txt
# * enum_methods_193_p0.txt
#
# == TODO
#
# * Fix differences between tests previous to 1.8.7.
# * Fix subtle differences between tests for the 1.9.x series.
#
# == Author
#
# Guy Allard
#
# == Copyright
#
# Copyright (c) 2009, 2010, 2011 Guy Allard
# Licensed under the same terms as Ruby.  No warranty is provided.
#

