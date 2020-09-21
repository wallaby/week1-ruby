# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/btlang for more book information.
#---
class Tree
  attr_accessor :children, :node_name

  def initialize(name, children = [])
    @children = children
    @node_name = name
  end

  def self.tree_from_hash(tree = {})
    raise('Not a tree! If it is a forest then call forest_from_hash.') if tree.size > 1

    return forest_from_hash(tree)[0] if tree.size == 1
  end

  def self.forest_from_hash(trees = {})
    forest = []
    trees.each do |node_name, value|
      forest.append(Tree.new(node_name, forest_from_hash(value)))
    end
    forest
  end

  def visit_all(&block)
    visit(&block)
    children.each { |c| c.visit_all(&block) }
  end

  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new("Ruby",
                     [Tree.new("Reia"),
                      Tree.new("MacRuby")])

puts "Visiting a node"
ruby_tree.visit { |node| puts node.node_name }
puts

puts "visiting entire tree"
ruby_tree.visit_all { |node| puts node.node_name }

ruby_tree2 = Tree.tree_from_hash( {'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } })

puts "second approach"
ruby_tree2.visit_all { |node| puts node.node_name }
