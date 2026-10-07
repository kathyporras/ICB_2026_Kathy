def GC_content(seq):
    
    """write a description for 
    your function
    
    >>> GC_content("ATATATATATATATA")
    0.0
    >>> GC_content("GGGGGGGGCCCCCCC")
    1.0
    >>> GC_content("ACACACTGTGTG")
    0.5
    """ 

    g_cont = seq.count("G")
    c_cont = seq.count("C")

    gc = (g_cont + c_cont) / len(seq)
    return(gc)