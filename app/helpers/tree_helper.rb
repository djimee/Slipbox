module TreeHelper
=begin
    
tree_helper.rb contains the structuring and
methods for generating and parsing 
N-array trees into HTML format

when a node is deleted, the whole tree is reparsed
from a given dataset

=end
        
    class Tree
        
        attr_accessor :trees
        attr_accessor :value


        def initialize(val)
            @value = val
            @trees = []
        end

        def add_node(val)
            @trees.push(Tree.new(val))
        end   
        
        


    end

    class DepthFirstSearch
    
        # def search(tree, val) 
        #     tree.children.each do |child|
        #         if child.chilren.length > 0
        #             if child.value === val
        #                 return child
        #             end
        #             search(child, val)
        #         end
        #     end
        # end
    end

    class HTMLParser

        attr_accessor :html_tree

        def initialize()
            @html_tree = ""
        end

        def construct(tree)
            @html_tree += "<ul>"
          
            tree.trees.each do |child|
                @html_tree += "<li class='node'>"
                @html_tree += "<p class='thread-button'>" + child.value + "</p>"
             
                construct(child)
                @html_tree += "</li>"
            end
            @html_tree += "</ul>" 

        end
    end


    def generate_tree
        _tree = Tree.new("a")
         _parse = HTMLParser.new()
          _tree.add_node("b")
        
         _tree.add_node("c")
      
         _parse.construct(_tree) 
        puts _parse.html_tree
        return  + _parse.html_tree 
    end
end
        
        
