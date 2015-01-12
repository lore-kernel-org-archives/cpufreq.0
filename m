From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 91141] acpi-cpufreq cannot be loaded.
Date: Mon, 12 Jan 2015 04:24:16 +0000
Message-ID: <bug-91141-12968-dyEKZqmyT8@https.bugzilla.kernel.org/>
References: <bug-91141-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-91141-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=91141

Zhang Rui <rui.zhang@intel.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO
                 CC|                            |rui.zhang@intel.com

--- Comment #1 from Zhang Rui <rui.zhang@intel.com> ---
please make sure your kernel is built with CONFIG_DYNAMIC_DEBUG=y.
please make sure the debugfs is mounted
Then, please run
"echo -n 'file acpi-cpufreq.c +p' > <debugfs>/dynamic_debug/control"
"echo -n 'file cpufreq.c +p' > <debugfs>/dynamic_debug/control"
"echo -n 'file processor_perflib.c +p' > <debugfs>/dynamic_debug/control"
before modprobe the acpicpufreq driver
and attach the dmesg output after it.

please attach the .dat tables using the following script:
#!/bin/bash

TABLE_PATH=/sys/firmware/acpi/tables

for i in $(ls $TABLE_PATH)
do
        if [ -d $TABLE_PATH/$i ]
        then
                continue
        fi
        cat $TABLE_PATH/$i > /tmp/$i.dat
done

for j in $(ls $TABLE_PATH/dynamic)
do
        cat $TABLE_PATH/dynamic/$j > /tmp/$i.dat
done

-- 
You are receiving this mail because:
You are the assignee for the bug.
