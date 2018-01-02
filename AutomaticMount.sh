eth_nodes_byIP=(10.1.1.3 10.1.1.4 10.1.1.5 10.1.1.6 10.1.1.7 10.1.1.8 10.1.1.9 10.1.1.10 10.1.1.11 10.1.1.1 3 10.1.1.14 10.1.1.15 10.1.1.16 10.1.1.17 10.1.1.18 10.1.1.19 10.1.1.20 10.1.1.21 10.1.1.22 10.1.1.23 10.1.1.24 10.1.1.25 10.1.1.26 10.1.1.27)

ib_nodes_byIP=(10.2.1.3 10.2.1.4 10.2.1.5 10.2.1.6 10.2.1.7 10.2.1.8 10.2.1.9 10.2.1.10 10.2.1.11 10.2.1.13 10.2.1.14 10.2.1.15 10.2.1.16 10.2.1.17 10.2.1.18 10.2.1.19 10.2.1.20 10.2.1.21 10.2.1.22 10.2.1.23 10.2.1.24 10.2.1.25 10.2.1.26 10.2.1.27)

nodes_byName=(node1 node2 node3 node4 node5 node6 node7 node8 node9 node11 node12 node13 node14 node15 node16 node17 node18 node19 node20 node21 node22 node23 node24 node25)

host=`hostname`
echo "Checking from node $host"
#echo "Mounting on node: $host" >> output_$host
echo "////////////////////////////////////////"
for i in "${nodes_byName[@]}"
do
    echo "Ping $i ......."
    if ping -q -c 2 -W 1 $i >/dev/null; then
        echo "$i up"
        echo "\t 1. Mounting /opt/hpe/hpc folder..."
        #ssh $i 'mount -t nfs supernodexp-headnode:/opt/hpe/hpc /opt/hpe/hpc'

        echo "\t 2. Mounting /home folder..."
        #ssh $i 'mount -t nfs supernodexp-headnode:/home /home'

        echo "\t 3. Mounting /opt/share folder..."
        #ssh $i 'mount -t nfs supernodexp-headnode:/opt/share /opt/share'

        echo "\t 4. Mounting /opt/yum folder..."
        #ssh $i 'mount -t nfs supernodexp-headnode:/opt/yum /opt/yum'
    else
        echo "$i down"
    fi
    echo "////////////////////////////////////////"
    echo
done
echo "Finish!"