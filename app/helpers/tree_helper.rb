

module TreeHelper

#Sanitize gem config



=begin
    
tree_helper.rb contains the structuring and
methods for generating and parsing 
N-array trees into HTML format

when a node is deleted, the whole tree is reparsed
from a given dataset


TODO:

-Check for nil values in DFS to prevent crashes

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
        
        def add_tree(tree)
            @trees.push(tree)
        end

        
    end

    class DepthFirstSearch
    
        def search_append(t, a, val) 
            if t.value === val
                t.add_tree(a)
                puts t.trees
                return "Added tree"
            end
            t.trees.each do |child|
               
                if child.value === val
                    child.add_tree(a)
                    puts child.trees
                    return "Added tree"
                end
                search_append(child, a, val)
            end
            return "Could not find node"
        end
    end

    class HTMLParser

        attr_accessor :html_tree, :margin_top

        def initialize()
            @html_tree = ""
            @margin_top = 10
        end

        def construct(tree, mar)
            @html_tree += "<a href=''><p>" + tree.value + "</p></a>"
            @html_tree += "<ul class='list-start'>"
            mar += 30
            tree.trees.each do |child|
                @html_tree += "<li class='node'>"
                construct(child, mar)
                @html_tree += "</li>"
            end
            mar -= 30
            @html_tree += "</ul>" 

        end
    end


    def generate_tree
        _tree = Tree.new("a")
        _tree.add_node("a1") 
        _tree.add_node("a2") 

        _tree2 = Tree.new("b")
        _tree2.add_node("b1")
        _tree2.add_node("b2")
        


        _tree3 = Tree.new("c")
        _tree3.add_node("c1")

        _DFS = DepthFirstSearch.new

        #puts _DFS.search_append(_tree2, _tree3, "b")
        puts _DFS.search_append(_tree, _tree2, "a")


         #build tree
       _parse = HTMLParser.new()
        _parse.construct(_tree, 30) 
        return  "<div class='center-container'>" + _parse.html_tree + "</div>"
        
    
    end
end
        
        
