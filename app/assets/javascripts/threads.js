"use strict"

let currentRoot = "";
let children = ["1:root"]


children.push("1i:node");
children.push("1ii:node");
children.push("1iia:node");
children.push("1iip:node");

children.push("1iii:node");
children.push("1iiia:node");
children.push("1iiib:node");
children.push("1iiic:node");
children.push("1iiid:node");
children.push("1iiie:node");
children.push("1iiif:node");


//if delete a node then remove all information,
//draw id as a 'filler' id on the thread tree


class Node {

    constructor(id, val) {
        this.id = id;
        this.name = val;
        this.children = [];
    }

    getId() { return this.id; }
    getName() { return this.name; }
    getChildren() { return this.children; }
    resetChildren() { this.children = []; }

}

class RecNode {

    constructor(parentId) {
        this.nodeLength = 0;
    }

    increment() {
        this.nodeLength++;
    }

    getNodeLength() {
        return this.nodeLength;
    }

}

class GenerateTree {

   constructor() {
       this.json = {};
       this.NODE_REC_LIMIT = 4 ;
   }

    findRootNode(nodeList, root) {
        let n =  null;
        nodeList.forEach((e) => {
           
        if (e.split(":")[0] == root.split(":")[0]){
            let items = e.split(":");
            n = new Node(items[0], items[1]);
        }}
);      
        currentRoot = n;
        return n;
    }; 

    containsRecNode(children) {
        if (children[0] instanceof RecNode) {return true;}
        return false;
    }

    addNode(root, parent, node) { 
        let parentId = parent.split(":")[0];
        if (root.getId() == parentId) {
            if (this.containsRecNode(root.getChildren())) {
                root.getChildren()[0].increment();
            } else {
                let info = node.split(":");
                root.getChildren().push(new Node(info[0], info[1]));
            }
            if (root.getChildren().length > this.NODE_REC_LIMIT && parent.split(":")[0] != currentRoot.getId()) {
                root.resetChildren();  
                root.getChildren().push(new RecNode(root.getId()));
            }
            
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

    visitRecNode() {

    }


    generateTree(nodeList, root) {
        let tree = this.findRootNode(nodeList, root);
        console.log(tree);
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

    decideText(d) {
        if (d.data.id == undefined) {
            return "+" +  d.data.nodeLength.toString() + " nodes"
        }
        return d.data.id + "\n" + d.data.name;
        
    }

    clickHandler(e, i) {
        if (i.data.id == undefined) {           //instanceof RecNode
            d3.select("svg").selectAll("path").remove();
            d3.select("svg").selectAll("text").remove();
            let newRoot = i.parent.data;
            console.log(newRoot);
            console.log(children);
            let result = new GenerateTree().generateTree(children, newRoot.id + ":" + newRoot.name);
            new RenderTree(result);
        } else {
            //TODO - redirect to note page
        }
    }

    drawTree(treeJSON) {
      
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
                .text(d => this.decideText(d))

                .on("click", (e, i) => this.clickHandler(e, i))
    }
}

let tree = new GenerateTree();
let result = tree.generateTree(children, "1:root");
new RenderTree(result); 








