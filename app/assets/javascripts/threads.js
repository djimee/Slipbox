"use strict"

class Node {

    constructor(id, val, children) {
        this.id = id;
        this.name = val;
        this.children = [];
    }

    getId() {
        return this.id;
    }

    getName() {
        return this.name;
    }

    getChildren() {
        return this.children;
    }
}

class GenerateTree {

   constructor() {
       this.json = {};
   }

    findRootNode(nodeList) {
        let items = nodeList[0].split(":");
        return new Node(items[0], items[1], items[2]);
    }; 

    addNode(tree, id, node) {
        let nodeInfo = node.split(":");
        if (tree.getChildren().length > 0) {
            //recurse on child node
            for (let c in tree.getChildren()) {
                let childID = tree.getChildren()[c].getId();
                if (childID.substring(0, id+1) == node.substring(0, id+1)) {
                    if (childID.substring(0, id+2) == node.substring(0, id+2)) {
                        this.addNode(tree.getChildren()[c], id + 1, node);                        
                    } else {
                        console.log("Adding recursive step child");
                        let items = node.split(":");
                        tree.getChildren().push(new Node(items[0], items[1], items[2]));
      
                    }
                    break;
                }
            }                
        } else {
            console.log("Adding child");
            let items = node.split(":");
            tree.getChildren().push(new Node(items[0], items[1], items[2]));

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
        this.canvas = d3.select("thread-container").append('svg')
            .attr("width", 800)
            .attr("height", 800)
            .append('g')
                .attr("transform", "translate(50, 50)");
        this.drawTree(treeJSON)

    }

    drawTree(treeJSON) {
        console.log(treeJSON);
        let container = document.getElementById('thread-container');
        const width = container.clientWidth;
        const height = container.clientHeight;
        console.log(width);
        const svg = d3.select('svg');

        let treeLayout = d3.tree()
            .size([height, width])
        
        svg
            .attr("width", width)
            .attr("height", height)
        
      
        const root = d3.hierarchy(treeJSON);
        const links = treeLayout(root).links();
        const linkPathGenerator = d3.linkVertical()
            .x(d => d.x)
            .y(d => d.y);
        
        //control rendering of graph elements
        svg.selectAll('path').data(links).enter().append('path')
            .attr('d', linkPathGenerator);

        svg.selectAll('text').data(root.descendants())
            .enter().append('text')
                .attr('x', d => d.x)
                .attr('y', d => d.y)
                .text(d => d.data.name);

    }
}



let tree = new GenerateTree();
let children = []

for (let x = 0; x < 5; x++) {
    children.push("1i:asd" + x.toString())
}
let result = tree.generateTree(children);
let render = new RenderTree(result);

