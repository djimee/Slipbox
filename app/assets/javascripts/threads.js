/** How it works
 * 
 *  ===OVERVIEW===
 *  The code takes in an array of note ids and names formatted 
 *  in a string like this - "id:name" (haven't implemented date created)
 *  and automatically generates the tree based on the array.
 * 
 *  For notes that have ids with parent notes whose ids don't exist (The note doesn't exist in the db), I had to draw dots 
 *  representing those parent notes.
 * 
 * 
 *
 *   ====CLICKING ON A NODE====
 *   Each node displays its id and name. If you click on it a modal appears
 *   and you can visit the note, add a new one from the note you clicked on or deleting it.
 * 
 * 
 * 
 *   ===NODE LIMIT===
 *   Due to the size of the tree, number of child nodes and issues with 
 *   displaying nodes with long names, I had to create a node limit (currently 5).
 * 
 * 
 * 
 *  ===PROBLEMS(IMPORTANT)===
 *  ROOT NODE -> (there may be a problem with finding the root node so it may not work
 *   this'll be a bug fix
 *   ) 
 *   For now use "1:name" as the root node
 * 
 *  MULTIPLE TREES -> Also I don't think it can display multiple trees so we're gonna have to display a single thread
 *  for each slipbox.
 * 
 *  ADDING NOTES -> Will the user add a note from a parent, or be able to do it manually (have any id they want ) ?
 *  
 *  DELETED NOTES -> For now the system draw dots for notes that lead to exisiting notes whose parents don't exist,
 *  this goes back to question of how notes will be added. If they are added directly from the parent node then
 *  we shouldn't have to use dots (they're also a lot slower to generate !)
 * 
 */



"use strict"

//TODO
/**
 * 1) Draw tooltips underneath the graph
 * 2) Integration testing
 * 3) Optimisation of recusrion
 */


const baseRoot = "1:root"; //starting node shouldn't be hard-coded
const modal = document.getElementById("note-modal");
const modalClose = document.getElementById("close-btn");
const NODE_REC_LIMIT = 5; //limits number of child nodes

let currentRoot = "";
let nodes = ["1:root"];
let ids = [];
let unassigned = [];
nodes.push("1ii:node");


nodes.push("1iia:node");
nodes.push("1iiiia:node");
nodes.push("1iiiib:node");
nodes.push("1iiiic:node");
nodes.push("1iiiie:node");
nodes.push("1iiiif:node");
nodes.push("1iiiid:node");


//represents a node in the tree
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

//this is a node representing child nodes of a node that have
//too many children. 
class RecNode {

    constructor() {
        this.nodeLength = 0;
    }

    increment() {
        this.nodeLength++;
    }

    getNodeLength() {
        return this.nodeLength;
    }

}

// This represents a node that needs to be present for the thread
//tree to parse nodes that aren't direct children of current nodes.
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
       this.sortNodes(nodes);
   }

   sortNodes(ns) {
        let  nodeObjects = [];
        ns.forEach((n) => nodeObjects.push({id: n.split(":")[0], value: n.split(":")[1]}))
        nodeObjects.sort((a, b) => {return a.id.length - b.id.length;});
        nodes = [];
        nodeObjects.forEach((n) => nodes.push(n.id + ":" + n.value));
   }

   loadIds() {
     nodes.forEach((e) => { ids.push(e.split(":")[0]); });
   }
   findRootNode(nodeList, root) {
        let n =  null;
        let tI = root.split(":");
        if (tI[1] == "") {
            currentRoot = new Node(tI[0], tI[1]);
            return new Node(tI[0], tI[1]);
        }
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
                    root.getChildren().push(new Node(info[0], info[1]));
                } 
            }
            if (root.getChildren().length > NODE_REC_LIMIT && parent.split(":")[0] != currentRoot.getId()) {
                root.resetChildren();  
                root.getChildren().push(new RecNode());
            }
        } else {
            
            for (let i in root.getChildren()) {
                if (!(root.getChildren()[i] instanceof RecNode)) {
                    if (root.getChildren()[i].getId() == parentId) {
                        this.addNode(root.getChildren()[i], parent, node);
                    } else {
                        this.addNode(root.getChildren()[i], parent, node);
                    }
                } else {
                    break;
                }
            }
            
        }
        return root;
    };

   

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

        this.drawTree(treeJSON)
    }

    decideText(d) {
        if (d.data.id == undefined) {
            return  "Click to expand."
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
        new RenderTree(new GenerateTree().generateTree(children, newRoot.id + ":" + newRoot.name));
    }

    clickHandler(e, i) {
        if (i.data.id == undefined) {   //instance of RecNode                  
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
let result = tree.generateTree(nodes, "1:root");
new RenderTree(result); 

//modal section
modalClose.onclick = function() {modal.style.display = "none"};
window.onclick = (e) => {if (e.target == modal) {modal.style.display = "none"}};
