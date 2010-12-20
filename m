From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 23412] Only the lowest CPU frequency available on laptop
 working from battery.
Date: Mon, 20 Dec 2010 09:22:17 GMT
Message-ID: <201012200922.oBK9MHbq022305@demeter1.kernel.org>
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
           Priority|P1                          |P5
           Severity|normal                      |enhancement




--- Comment #7 from Thomas Renninger <trenn@suse.de>  2010-12-20 09:20:27 ---
> I have found a BIOS feature "Andvanced power management"
Sounds related.

> I don't really know what is this feature for
Yep, finding out why the BIOS sets the frequency limit can be cumbersome.

Still, it's not a kernel, but a BIOS/platform issue.
As said, all initial BIOS limits were ignored by the kernel for quite some time
and this got fixed. Have you looked for BIOS updates and their changelogs
already? If not, this would be the next step.

If this also does not help, please attach acpidump output (with the new BIOS!).
Be aware that this is very low prio bug, as it's very likely that the culprit
(most likely this is even intended) comes from the BIOS.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
