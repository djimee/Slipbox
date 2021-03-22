module TreeHelper
=begin
    
tree_helper.rb contains the structuring and
methods for generating and parsing 
N-array trees into HTML format

when a node is deleted, the whole tree is reparsed
from a given dataset

=end
        
    class Tree

        def initialize(val)
            @value = val
            @children = []
        end

        def get_children
            return @children
        end

        def get_val
            return @value
        end

        def add_node(val)
            @children.push(Tree.new(val))
        end    
    end

    class DepthFirstSearch
    
        def search(tree, val) 
            tree.children.each do |child|
                if child.chilren.length > 0
                    if child.value === val
                        return child
                    end
                    search(child, val)
                end
            end
        end
    end

    class HTMLParser

        attr_accessor :html_tree

        def initialize()
            @html_tree = ""
        end

        def construct(tree)
            puts  tree.to_s
            @html_tree += "<ul>"
            tree.get_children do |child|
                @html_tree += "\n" + "<li>"
                
                    if child.get_val === val
                        @html_tree += "<button>" + val + "</button>"
                    end
                    construct(child)
                    @html_tree += "</li>"

            end
            @html_tree += "</ul>" 

        end

        def get_tree 
            return @html_tree
        end

    end


    def generate_tree
        _tree = Tree.new("a").add_node("b")
         _parse = HTMLParser.new()
         _parse.construct(_tree) 
        puts _parse.get_tree
        return _tree
    end
end
        
        
