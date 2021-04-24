var config = {
        container: "#exampleTree",

        connectors: {
            type: 'curve'
        },
        node: {
            HTMLclass: 'nodeExample1'
        }
    }

chart_config = [] //important! - needed for the drawing engine


//the root has no parent
function makeRootNode(id, t, linkToNote = null) {
  node = {
    stackChildren:true, //child
    text: {
        //unique ID
        uniqueId: {
          val: id.substring(1, id.length), //var names can't start with numbers, so we stick an 'n' before each ID
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
          val: id.substring(1, id.length), //var names can't start with numbers, so we stick an 'n' before each ID
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

nodeListString = ['1', '1a', '1b', '1a1', '1a2', '1a3','1a1a', '1a1b', '1a2d', '1a2e', '1a2a', '1a2b', '1a2c', '1a2c1', '1b1', '1b1a', '1b1b', '1b1a1', '1b1a1b', '1b1a1b1', '1b1a1b1a', '1b1a1b1a1', '1b1a1b1a1a'];

for(const node of nodeListString) {
  var nodeString =  'n' + node;

  if (node.length == 1) {
    eval('var ' + nodeString + ' = ' + 'makeRootNode(nodeString, \'this is an example of a ROOT node right here in front of your eyes\',)');
  }
  else {
    eval('var ' + nodeString + ' = ' + 'makeChildNode(nodeString, \'This is an example of a CHILD node right here in front of your eyes\')');
  }
  chart_config.push(eval(nodeString));
}

chart_config.push(config);
