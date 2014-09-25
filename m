From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 58001] "ondemand" CPU governor never raises frequency (Dell XPS
 12)
Date: Thu, 25 Sep 2014 14:31:56 +0000
Message-ID: <bug-58001-12968-Adl3k6r9yB@https.bugzilla.kernel.org/>
References: <bug-58001-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-58001-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=58001

--- Comment #22 from Paul Johnson <pauljohn@ku.edu> ---
Is it possible that different Intel chips respond differently?  I'm running
Ubuntu 14.04 on 2 laptops and one has the problem, the other does not. 

On the Dell Precision m4600 laptop, I had the chronic problem that, after
suspend, I was always stuck at 800MHZ.  To fix that, I had to explicitly reset
the threshold lower.  Eventually, I found a script that did it


#!/bin/bash


## https://gist.github.com/Pyppe/6028707
# default with 13.04 is 95
SCALING_FILE=/sys/devices/system/cpu/cpufreq/ondemand/up_threshold

defvalue=70

if [ ! -f "$SCALING_FILE" ]; then
                echo "$SCALING_FILE not found"
                exit 1
fi

limit=${1:-$defvalue}

if [[ $limit -lt 100 && $limit -gt 30 ]]; then
                sudo bash -c "echo $limit > $SCALING_FILE"
else
                echo "Invalid value"
                exit 1
fi

However, on a Dell Latitude 6430u, I have no such problem.  Frequency scaling
works without qualification, before and after suspend.

-- 
You are receiving this mail because:
You are the assignee for the bug.
