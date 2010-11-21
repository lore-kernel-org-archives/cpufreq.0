From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 23412] Only the lowest CPU frequency available on laptop
 working from battery.
Date: Sun, 21 Nov 2010 17:06:05 GMT
Message-ID: <201011211706.oALH654D006839@demeter1.kernel.org>
References: <bug-23412-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-23412-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=23412


Thomas Renninger <trenn@suse.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |trenn@suse.de




--- Comment #1 from Thomas Renninger <trenn@suse.de>  2010-11-21 17:06:05 ---
Please check your BIOS for an option like "powersave", "powersave on battery"
or somehow related to this.
If you do not find it read up the BIOS manual, possibly do a BIOS upgrade first
if you really do not find anything.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
