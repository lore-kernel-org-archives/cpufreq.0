From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 58001] "ondemand" CPU governor never raises frequency (Dell XPS
 12)
Date: Thu, 25 Sep 2014 00:16:56 +0000
Message-ID: <bug-58001-12968-cddyAXya9o@https.bugzilla.kernel.org/>
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

Doug Smythies <dsmythies@telus.net> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |dsmythies@telus.net

--- Comment #20 from Doug Smythies <dsmythies@telus.net> ---
intel_pstate=enable on the proper grub line should work. Here is an example
from mine (/etc/default/grub):

GRUB_CMDLINE_LINUX_DEFAULT="ipv6.disable=1 intel_pstate=enable
crashkernel=384M-:128M"

Of course, run "sudo update-grub" afterwards.

-- 
You are receiving this mail because:
You are the assignee for the bug.
