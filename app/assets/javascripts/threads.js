"use strict"

class Node {

    constructor(id, val) {
        this.id = id;
        this.name = val;
        this.children = [];
        this.recursion = true;
    }

    getId() { return this.id; }
    getName() { return this.name; }
    getChildren() { return this.children; }
    getRecursion() { return this.recursion; }

    setRecursion(rec) { this.recursion = rec; }
    resetChildren() { this.children = []; }

}

class GenerateTree {

   constructor() {
       this.json = {};
       this.NODE_REC_LIMIT = 10;
   }

    findRootNode(nodeList) {
        let items = nodeList[0].split(":");
        return new Node(items[0], items[1]);
    }; 

    addNode(tree, id, node) {

        //children node cap
        if (tree.getChildren().length > this.NODE_REC_LIMIT) {
            tree.resetChildren();
            tree.setRecursion(false);
        }
        if (tree.getRecursion() == true) {
            if (tree.getChildren().length > 0) {
                //recurse on child node
                for (let c in tree.getChildren()) {
                    
                    let childID = tree.getChildren()[c].getId();
                    if (childID.substring(0, id+1) == node.substring(0, id+1)) {
                        if (childID.substring(0, id+2) == node.substring(0, id+2)) {
                            this.addNode(tree.getChildren()[c], id + 1, node);                        
                        } else {
                            let items = node.split(":");     
                            tree.getChildren().push(new Node(items[0], items[1]));
                            
                        }
                        break;
                    }
                }   
                                
            } else {
                
                let items = node.split(":");
                tree.getChildren().push(new Node(items[0], items[1]));
            }
        } else {
            tree.resetChildren();
            tree.getChildren().push(new Node(id, "Too Large"))
        }
        
        return tree;
    };


    generateTree(nodeList) {
        let list = ["1:asd"];
        let tree = this.findRootNode(list);
        //initial addition to JSON for d3 rendering
        
        

        for (let n in nodeList) {
            tree = this.addNode(tree, 0, nodeList[n]);
        }

        this.json.id = tree.getId();
        this.json.name = tree.getName();
        this.json.children = tree.getChildren();

    
        return this.json;
    };
}

class RenderTree {

    constructor(treeJSON) {
        let container = document.getElementById('thread-container');
        this.CONTAINER_WIDTH = container.clientWidth;
        this.CONTAINER_HEIGHT = container.clientHeight;
        this.TREE_SCALE_X = 0.8;
        this.TREE_SCALE_Y = 0.2;
        this.canvas = d3.select("thread-container").append('svg')
            .attr("width", this.CONTAINER_WIDTH)
            .attr("height", this.CONTAINER_HEIGHT)
            .append('g')
                .attr("transform", "translate(50, 50)");
        this.drawTree(treeJSON)

    }

    drawTree(treeJSON) {
        console.log(treeJSON);
      
        const svg = d3.select('svg');

        let treeLayout = d3.tree()
            .size([this.CONTAINER_HEIGHT, this.CONTAINER_WIDTH])
        
        const g = svg
                .attr("width", this.CONTAINER_WIDTH)
                .attr("height", this.CONTAINER_HEIGHT)
                
            .append("g")
                .attr("transform", "translate(50, 0)");

        svg.call(d3.zoom().on('zoom', (e) => {
            g.attr('transform', e.transform);
        }));
      

        const root = d3.hierarchy(treeJSON);
        const links = treeLayout(root).links();
        const linkPathGenerator = d3.linkHorizontal()
            .x(d => d.y * this.TREE_SCALE_Y)
            .y(d => d.x * this.TREE_SCALE_X);
        
        //control rendering of graph elements
        g.selectAll('path').data(links).enter().append('path')
            .attr('d', linkPathGenerator);
        
        
        

        g.selectAll('text').data(root.descendants())
            .enter().append('text')
                .attr('x', d => d.y * this.TREE_SCALE_Y)
                .attr('y', d => d.x * this.TREE_SCALE_X)
                .text(d => d.data.name)
               // .on("mouseover", (e) => {console.log(e)});


    }
}



let tree = new GenerateTree();
let children = []

for (let x = 0; x < 13; x++) {
    children.push("1i:asd" + x.toString())
}
let result = tree.generateTree(children);
let render = new RenderTree(result);

