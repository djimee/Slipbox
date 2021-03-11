module TreeHelper
    =begin
        
    tree_helper.rb contains the structuring and
    methods for generating and parsing 
    N-array trees into HTML format
    
    when a node is deleted, the whole tree is reparsed
    from a given dataset
    
    
        
    =end
    
        class Tree
            attr_accessor :children, :value
    
            def initialize(val)
                @value = val
                @children = []
            end
    
            def add_node(val)
                @children << Tree.new(val)
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
    
             def construct(tree, tabs)
                _tabs = ""
                #generate tabs for better readability
    
                for i in tabs
                    _tabs += "\t"
                end
    
                @html_tree += "\n" + _tabs + "<ul>"
                tree.children.each do |child|
                    @html_tree += "\n" + _tabs + "\t" + "<li>"
                    if child.chilren.length > 0
                        if child.value === val
                            @html_tree += "<button>" + val + "</button>"
                        end
                        construct(child, tabs + 1)
                    end
                    @html_tree += _tabs + "\t" + "</li>"
                end
                @html_tree += _tabs + "</ul>" 
    
             end
        end
    end
    
    