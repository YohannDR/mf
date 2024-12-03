def extract_labels(string=False):
    labelsFile = open("./mf_us.map")
    labels = {}

    line = labelsFile.readline()
    while line != '':
        line = line.splitlines()[0]
        if line.startswith("                0x02") or line.startswith("                0x03"):
            split = line.split()
            if len(split) == 4:
                labels[split[0] if string else int(split[0], 16)] = split[1]
        if line.startswith("                0x08"):
            split = line.split()
            if len(split) == 2:
                labels[split[0] if string else int(split[0], 16)] = split[1]
        line = labelsFile.readline()

    labelsFile.close()

    return labels
