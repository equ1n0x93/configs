import requests, os, pandas, pickle
import socket, struct


def ipv4_int2str(ip_int):
    """
    Convert long to ip str
    """
    return socket.inet_ntoa(struct.pack('!L', ip_int))


def ipv4_str2int(ip_str):
    """
    Convert ip str to long
    """
    packed = socket.inet_aton(ip_str)
    return struct.unpack("!L", packed)

