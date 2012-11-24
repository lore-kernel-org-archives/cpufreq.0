From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 50721] CPU freqs stay stuck at max after reboot with on-demand
 governor set - i7-2630QM
Date: Sat, 24 Nov 2012 01:11:17 +0000 (UTC)
Message-ID: <20121124011117.364E311FB5A@bugzilla.kernel.org>
References: <bug-50721-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-50721-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=50721





--- Comment #4 from rocko <rockorequin@hotmail.com>  2012-11-24 01:11:16 ---
Created an attachment (id=87151)
 --> (https://bugzilla.kernel.org/attachment.cgi?id=87151)
Log output from turbostat and other commands

Here's the output from turbostat, top, and cpuinfo after I booted the system
and the cores stayed stuck in max frequency. I also included the output from
turbostat after a suspend/resume cycle, when the cores had successfully clocked
down to their min frequencies.

One point of strangeness is that first turbostat indicates frequencies up to
2.45GHz, which I thought is higher than my system allows. The subsequent
turbostat shows the cores running at around 2GHz. I suppose it is possible that
I ran the first command while the system was still using the performance
governor - could this be why the cores report 2.45GHz? The second turbostat
definitely was running when the ondemand governor was running, as you can see
from the 800Mhz reported in cpuinfo, and my frequency applet also was reporting
that the system was running in low performance mode.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
