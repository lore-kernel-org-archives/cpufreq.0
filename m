From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 16072] [HP Pavilion dm1-1110ev] Cpufreq doesn't work at all (
 Intel Celeron U2300 )
Date: Fri, 22 Oct 2010 19:37:35 GMT
Message-ID: <201010221937.o9MJbZMq021451@demeter2.kernel.org>
References: <bug-16072-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-16072-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=16072


Thomas Renninger <trenn@suse.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |DOCUMENTED




--- Comment #14 from Thomas Renninger <trenn@suse.de>  2010-10-22 19:37:18 ---
Sorry, I forgot about this one.
There was a thread about this CPU type on the cpufreq list recently:
http://www.spinics.net/lists/cpufreq/msg01764.html

It came out this type of CPU is not speedstep capable, but is still exporting
EST CPU capability (compare with flags /proc/cpuinfo).
You might want to verify with the Intel CPU sheet the guy found.

This one should get closed.
I close this one documented, others might want to read it up again.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
