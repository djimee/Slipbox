"use strict"

//TODO
/**
 * 1) Sort nodes to correctly parse them
 * 2) Draw tooltips underneath the graph
 * 3) Fix many bugs
 */


const baseRoot = "1:root";
const modal = document.getElementById("note-modal");
const modalClose = document.getElementById("close-btn");

let currentRoot = "";
let children = ["1:root"];
let ids = [];
let unassigned = [];

children.push("1i:node");
children.push("1ii:node");

children.push("1iia:node");
children.push("1iip:node");

//children.push("1iii:node");
children.push("1iiiia:node");
children.push("1iiiib:node");
children.push("1iiiic:node");
children.push("1iiiie:node");
children.push("1iiiif:node");
children.push("1iiiid:node");

//children.push("1iiib:node");



//if delete a node then remove all information,
//draw id as a 'filler' id on the thread tree

const NODE_REC_LIMIT = 5;


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

class FalseNode {

    constructor(id) {
        this.id = id;
        this.children = [];
    }

    getId() {
        return this.id;
    }

    getChildren() {
        return this.children;
    }
    resetChildren() {
        this.children = [];
    }
}

class GenerateTree {

   constructor() {
       this.json = {};
       this.NODE_REC_LIMIT = 4 ;
       this.loadIds();
   }

   sortNodes() {
       //TODO
   }

   loadIds() {
     children.forEach((e) => { ids.push(e.split(":")[0]); });
   }
   findRootNode(nodeList, root) {
        let n =  null;
        nodeList.forEach((e) => {
           
        if (e.split(":")[0] == root.split(":")[0]){
            let items = e.split(":");
            n = new Node(items[0], items[1]);
        }});      
        currentRoot = n;
        return n;
    }; 

    containsRecNode(children) {
        if (children[0] instanceof RecNode) {return true;}
        return false;
    }

    findimmediateParent(node) {
        let a = undefined;
        ids.forEach((e) => {
            if (e == node.substring(0, node.length - 1)) { a = e; }
        });
        return a;
    }

    checkDuplicates(array, nodeId) {
        
        let ch = false;
        for (let c in array) {
            
            if (array[c].getId() == nodeId) {
                
                ch = true;
                console.log(true);
            }
        }
        return ch;
    }   


    addNode(root, parent, node) { 
        let parentId = parent.split(":")[0];
        
        if (root.getId() == parentId) {
            if (this.containsRecNode(root.getChildren())) {
                root.getChildren()[0].increment();
            } else {
                //account for duplicates
                let info = node.split(":");

                if (!this.checkDuplicates(root.getChildren(), info[0])) {
                    console.log(info[0]);
                    root.getChildren().push(new Node(info[0], info[1]));
                } 
            }
            if (root.getChildren().length > NODE_REC_LIMIT && parent.split(":")[0] != currentRoot.getId()) {
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

    addFalseNode(root, parentId, nodeId) {        
        if (root.getId() == parentId) {
            root.getChildren().push(new FalseNode(nodeId));    
        } else {
            for (let i in root.getChildren()) {
                if (root.getChildren()[i].getId() == parentId) {
                    this.addFalseNode(root.getChildren()[i], parentId, nodeId);
                } else {
                    this.addFalseNode(root.getChildren()[i], parentId, nodeId);
                }
            }
        }
        return root;
    }

    generateTree(nodeList, root) {
        let tree = this.findRootNode(nodeList, root);
        //initial addition to JSON for d3 rendering
        for (let n in nodeList) {
            let info = nodeList[n].split(":");

            if (this.findimmediateParent(info[0]) == undefined && info[0].length > 1) {
                unassigned.push(nodeList[n]);
            }  else {
                let parent = info[0].substring(0, info[0].length - 1) + ":" + info[1]; 
                tree = this.addNode(tree, parent , nodeList[n]);
            }
        }

        //Add unassigned nodes
        for (let a in unassigned) {
            let res = undefined
            let nodesToAdd = [];
            let info = unassigned[a].split(":");
            let check = 1;
            while (res == undefined) {
                if (check < info[0].length) {
                    res = this.findimmediateParent(info[0].substring(0, info[0].length - check));
                    nodesToAdd.push(info[0].substring(0, info[0].length - check));
                }
                check++;
            }

            nodesToAdd = nodesToAdd.reverse();
            for (let n in nodesToAdd) {

                let parent = nodesToAdd[n].substring(0, nodesToAdd[n].length - 1) + ":"; 
                tree = this.addNode(tree, parent, nodesToAdd[n] + ":");
            }

            let parent = info[0].substring(0, info[0].length - 1) + ":"; 
            tree = this.addNode(tree, parent, unassigned[a]);
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

        //tooltips

        // d3.select("thread-container").append('p')
        //     .attr("x")

    
        this.drawTree(treeJSON)

    }

    decideText(d) {
        console.log(d);
        if (d.data.id == undefined) {
            return "+" +  ( NODE_REC_LIMIT + d.data.nodeLength).toString() + " nodes. Click to expand."
        }
        else if (d.data.name == "") {
            return "•";
        }
        return d.data.id + " - " + d.data.name;
        
    }

    regenerateTree(root) {
        let newRoot = root;
        d3.select("svg").selectAll("path").remove();
        d3.select("svg").selectAll("text").remove();
        let result = new GenerateTree().generateTree(children, newRoot.id + ":" + newRoot.name);
        new RenderTree(result);
    }

    clickHandler(e, i) {
        if (i.data.id == undefined) {                       //instanceof RecNode
                this.regenerateTree(i.parent.data)
                d3.select("svg")
                .append("text")
                .text("<< Go back")
                .attr("width", 100)
                .attr("height", 100)
                .attr("x", 5)
                .attr("y", 15)
                .attr("class", "event-text")
                .on("click", (e) => {

                    this.regenerateTree(new Node(baseRoot.split(":")[0], baseRoot.split(":")[1]))
                });
        } else {
            modal.style.display = "block"; 
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

        let graphElements = g.selectAll('path').data(links).enter();

        graphElements.append('path')
            .attr('d', linkPathGenerator);
        
        

        let tree = g.selectAll('text').data(root.descendants())
            .enter();
        
        tree.append('text')
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



modalClose.onclick = function() {modal.style.display = "none"};
window.onclick = (e) => {if (e.target == modal) {modal.style.display = "none"}};








