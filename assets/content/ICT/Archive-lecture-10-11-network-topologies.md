# ICT Archive Lecture — Lecture 10-11 - Network Topologies

_Source PDF preserved at `assets/source_notes/ICT/Lecture 10-11 - Network Topologies.pdf`._

Lecture 10: Fundamentals of Topologies
Network Topology
    Definition: The physical layout or arrangement of how
     computers are connected in a network.
    Importance: It shows how devices communicate and is a key
     design factor in networking.

Bus Topology
    Layout: All computers and devices are connected to a single
     central cable (called the bus).
    Advantages: Simple design, low cost, easy to expand.
    Disadvantages: If the main cable breaks, the whole network
     stops working.
    Example: Small office networks in earlier times.

Ring Topology
    Layout: Computers are connected in a circular path.
    Working: Data travels in one direction around the ring, passing
     through each computer until it reaches the destination.
    Advantages: Equal access for all devices.
    Disadvantages: If one computer or link fails, the entire
     network can stop.
    Example: Token Ring networks used in older LANs.

Star Topology
    Layout: All computers connect to a central device (hub or
     switch).
    Working: To send data, the sender passes it to the hub, which
     forwards it to the destination.
    Advantages: Easy to set up, expand, and troubleshoot. If one
     link fails, only that computer is affected.
    Disadvantages: If the hub fails, the whole network stops.
    Example: Modern LANs in homes and offices.

📊 Comparison of Network Topologies
 Feature    Bus Topology     Ring Topology     Star Topology
Layout     All devices      Devices          All devices
           connected to a   connected in a   connected to a
           single central   circular loop.   central
           cable (bus).                      hub/switch.
Data Flow Data travels      Data travels in  Data goes to hub,
           along the bus;   one direction    then forwarded to
           all devices      around the ring. destination.
           share the same
           cable.
Advantages Simple, low      Equal access for   Easy to set up,
           cost, easy to    all devices.       expand, and
           expand.                             troubleshoot.
Disadvanta If main cable    If one device/link If hub fails,
ges        fails, whole     fails, entire      whole network
           network stops.   network stops.     stops.
Example    Small office     Token Ring         Modern LANs in
Use        networks         networks (older homes and
           (older LANs).    LANs).             offices.
