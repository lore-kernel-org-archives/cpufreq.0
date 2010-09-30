From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19262] CPU0 locked at slower speed, regardless of governor
Date: Thu, 30 Sep 2010 08:51:42 GMT
Message-ID: <201009300851.o8U8pgVD017075@demeter1.kernel.org>
References: <bug-19262-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-19262-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=19262


Thomas Renninger <trenn@suse.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
                 CC|                            |cpufreq@vger.kernel.org,
                   |                            |trenn@suse.de
         AssignedTo|cpufreq@vger.kernel.org     |trenn@suse.de




--- Comment #3 from Thomas Renninger <trenn@suse.de>  2010-09-30 08:51:40 ---
Looks like the passive temperature threshold is exceeded for CPU0.
Hm, typically there is one thermal sensor/device connected to all CPUs, but if
this is related to the problem, CPU0 would have its own thermal device.
Can you provide:
for x in /proc/acpi/thermal_zone/*/*;do
       echo $x
       cat $x
       echo
done

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
You are the assignee for the bug.
