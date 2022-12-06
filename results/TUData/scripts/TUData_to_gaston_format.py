import sys
import string

# nodes ids are managed by the number of lines.
if (sys.argv[1]=='-h' or sys.argv[1]=='-help' or sys.argv[1]=='--help' or sys.argv[1]=='--h'):
  print('Expected files order: DS_graph_indicator.txt DS_node_labels.txt DS_A_txt DS_edge_labels.txt.')
  print('This script convert the given files with TUData format to a gaston treatable format.')
  sys.exit()

tmp = sys.argv[1]
tmp = tmp.split(sep='/')[-1]
tmp = tmp.split(sep='_')[0]
output_filename = sys.argv[1].replace(sys.argv[1].split(sep='/')[-1],tmp)
print('Input file: ', sys.argv[1], sys.argv[2], sys.argv[3], sys.argv[4], sep=', ')
print('Output file: ', output_filename)

try:
  graph_indicator_stream = open(sys.argv[1], "r")
  node_labels_stream = open(sys.argv[2], "r")
  a_stream = open(sys.argv[3], "r")
  edge_labels_stream = open(sys.argv[4], "r")
  output_stream = open(output_filename, "w")
except OSError:
  graph_indicator_stream.close()
  node_labels_stream.close()
  a_stream.close()
  edge_labels_stream.close()
  output_stream.close()
  print('Unable to read one of the files.')
  print('Expected files order: DS_graph_indicator.txt DS_node_labels.txt DS_A_txt DS_edge_labels.txt.')
  sys.exit()

modifier = 1
node_id = 1                                       # Is node/vertex id or line number
graph_id = graph_indicator_stream.readline()      # Contains current graph id as a string with '\n' at end
node_label_str = node_labels_stream.readline()    # Contains the label of the node as a string with '\n' at end
a_str = a_stream.readline()                         # Contains an edges  as a string with '\n' at end
a_str = a_str.replace(',', '')
a_str = a_str.replace('\n', '')
a_tab = a_str.split(' ')
edge_labels_str = edge_labels_stream.readline()


while (graph_id != '' and node_label_str != '' and a_str != '' and edge_labels_str != ''):
  graph_conv = int(graph_id) - 1
  output_stream.write('t # ' + str(graph_conv) + '\n')
  last_graph_id=graph_id
  while (graph_id==last_graph_id):
    output_stream.write('v ' + str(node_id - modifier) + ' ' + node_label_str)
    last_graph_id=graph_id
    node_id+=1
    graph_id=graph_indicator_stream.readline()
    node_label_str=node_labels_stream.readline()
  # ~ print(a_str)
  while (a_str != '' and int(a_str.split(' ')[0]) <= (node_id - 1)):
    output_stream.write('e ' + str(int(a_tab[0])-modifier) + ' ' + str(int(a_tab[1])-modifier) + ' ' + edge_labels_str)
    # Formating edge line
    a_str = a_stream.readline()
    a_str = a_str.replace(',', '')
    a_str = a_str.replace('\n', '')
    a_tab = a_str.split(' ')
    edge_labels_str=edge_labels_stream.readline()
    # ~ print('a_str: ', a_str)
    # ~ print('edge_labels_str: ', edge_labels_str)
  modifier = node_id
  

if not(graph_id == '' and node_label_str == '' and a_str == '' and edge_labels_str == ''):
  print('Error: at least one file has not reached end of file.')
  print('graph_id: ', graph_id)
  print('node_label_str: ', node_label_str)
  print('a_str: ', a_str)
  print('edge_labels_str: ', edge_labels_str)


graph_indicator_stream.close()
node_labels_stream.close()
a_stream.close()
edge_labels_stream.close()
output_stream.close()
