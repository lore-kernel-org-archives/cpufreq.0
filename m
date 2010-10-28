From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 16072] [HP Pavilion dm1-1110ev] Cpufreq doesn't work at all (
 Intel Celeron U2300 )
Date: Thu, 28 Oct 2010 15:31:13 GMT
Message-ID: <201010281531.o9SFVDUt010947@demeter1.kernel.org>
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





--- Comment #24 from Thomas Renninger <trenn@suse.de>  2010-10-28 15:30:57 ---
Robert: Please stop writing wrong assumptions you claim to know for sure. Also
only providing half information is nearly as bad as writing wrong ones.
> The power savings dropping from 2.8 GHz to 350 MHz is 144 to 109 W or nearly
> 24%.
I expect this is when the CPU is fully utilized?
The fact that you missed out some measures, smells like you do not like the
data, right?
But this bug is about something totally else, please open a new bug, add me to
CC and attach all info requested in comment #18. This is not about compiling a
kernel, it's simply measuring with a reboot in between, it doesn't take long...


For this very specific CPU this is about, I asked people who may have an idea,
but did not get an answer yet. Until now I expect freq switching is not
supported. But as deep C-states are, it's not that bad, you want to sleep as
soon as possible anyway.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
