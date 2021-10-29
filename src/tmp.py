#!/usr/bin/env python3

import os
from pathlib import Path

def main() -> int:
    pgrp = os.tcgetpgrp(os.open('/dev/tty', os.O_RDONLY))
    # print(Path('/proc/{}/pid_map'.format(pgrp)).read_text())
    print(Path('/proc/{}/status'.format(pgrp)).read_text())
    import time
    time.sleep(600)

    return 0


if __name__ == "__main__":
    exit(main())
