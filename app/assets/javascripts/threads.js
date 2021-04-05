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
        return new Node(items[0], items[1], null);
    }; 

    searchChildNodes(childNodes, node) {
        childNodes.foreach((n) => {if (n.getId() == node.getId()) {return n}});
        return null;
    }

    addNode(root, parent, node) {

        let parentId = parent.split(":")[0];
        if (root.getId() == parentId) {
            let info = node.split(":");
            root.getChildren().push(new Node(info[0], info[1]));
        } else {

            for (let i in root.getChildren()) {
                if (root.getChildren()[i].getId() == parentId) {
                    this.addNode(root.getChildren()[i], parent, node);
                } else {
                    this.addNode(root.getChildren()[i], parent, node);
                }
            }
        }
        return root;
    };


    generateTree(nodeList) {
        let list = ["1:asd"];
        let tree = this.findRootNode(list);
        //initial addition to JSON for d3 rendering
        
        for (let n in nodeList) {
            let info = nodeList[n].split(":");
            let parent = info[0].substring(0, info[0].length - 1) + ":" + info[1]; 
            tree = this.addNode(tree, parent , nodeList[n]);
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
        this.TREE_SCALE_X = 0.9;
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
        const linkPathGenerator = d3.linkVertical()
            .x(d => d.x * this.TREE_SCALE_X)
            .y(d => d.y * this.TREE_SCALE_Y);
        
        //control rendering of graph elements
        g.selectAll('path').data(links).enter().append('path')
            .attr('d', linkPathGenerator);
        
        

        
        
        let tree = g.selectAll('text').data(root.descendants())
            .enter().append('text')
                .attr('x', d => d.x * this.TREE_SCALE_X)
                .attr('y', d => d.y * this.TREE_SCALE_Y)
                .attr("class", "event-text")
                .attr("text-anchor", "middle")
                .text(d =>  d.data.id + "\n" + d.data.name)

                .on("click", (e) => {console.log("ASD")})


        
        


    }
}



let tree = new GenerateTree();
let children = []


children.push("1i:node");
children.push("1ii:node");
children.push("1iia:node");

children.push("1iii:node");



let result = tree.generateTree(children);
let render = new RenderTree(result);

