

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
            @html_tree += "<ul>"
            mar += 30
            tree.trees.each do |child|
                @html_tree += "<li class='node' style='margin-left:" + mar.to_s + "px; margin-top: "+ @margin_top.to_s + "px;'>"
                @html_tree += "<a href=''>" + child.value + "</a>"
                @html_tree += "<button class='delete'>del</button>"
                construct(child, mar)
                @html_tree += "</li>"
            end
            mar -= 30
            @html_tree += "</ul>" 

        end
    end


    def generate_tree
        _tree = Tree.new("a")

        _tree2 = Tree.new("b")
        _tree2.add_node("b1")
        _tree2.add_node("b2")
        _tree2.add_node("b3")
        _DFS = DepthFirstSearch.new
        puts _DFS.search_append(_tree, _tree2, "a")


         #build tree
       _parse = HTMLParser.new()
        _parse.construct(_tree, 30) 
        return  "<li id='root-node'>" + _tree.value + "</li>" + _parse.html_tree 
        
    
    end
end
        
        
