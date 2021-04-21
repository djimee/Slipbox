var config = {
        container: "#exampleTree",

        connectors: {
            type: 'step'
        },
        node: {
            HTMLclass: 'nodeExample1'
        }
    }

//the root has no parent
function makeRootNode(id, t, linkToNote = null) {
  node = {
    stackChildren:true, //child
    text: {
        //unique ID
        uniqueId: {
          val: id.substring(4, id.length),
          href: linkToNote
        },

        //title
        title: {
          val: t,
          href: linkToNote
        }
    }
  }

  return node;
}

//all child Nodes have a parent
function makeChildNode(id, t, linkToNote = null) {
  node = {
    parent: eval(id.substring(0, id.length-1)),
    stackChildren:true,
    text: {
        //uniqueID
        uniqueId: {
          val: id.substring(4, id.length),
          href: linkToNote
        },

        //title
        title: {
          val: t,
          href: linkToNote
        }
    }
  }

  return node;
}

node1 = makeRootNode('node1', 'note title');
node1a = makeChildNode('node1a', 'note title');
node1a1 = makeChildNode('node1a1', 'note title');
node1a1b = makeChildNode('node1a1b', 'note title');
node1a1c = makeChildNode('node1a1c', 'note title');
node1a2 = makeChildNode("node1a2", 'note title');

chart_config = [
    node1,
    node1a,
    node1a2,
    config,
    node1a1,
    node1a1b,
    node1a1c
];
