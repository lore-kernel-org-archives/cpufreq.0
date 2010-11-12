From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 14771] "ondemand" never raises frequency on an Intel Core2 Due
 (T9900) in a recent Dell E6500
Date: Fri, 12 Nov 2010 19:09:38 GMT
Message-ID: <201011121909.oACJ9clT016169@demeter2.kernel.org>
References: <bug-14771-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-14771-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=14771


vyncere <vyncere@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |vyncere@gmail.com




--- Comment #23 from Thomas Renninger <trenn@suse.de>  2010-06-28 15:43:23 ---
> note that when i'm plugged in to my 90W power supply, the ondemand gov works
> fine.
Ah yes..., this really isn't a kernel bug. Can someone with enough privileges
(the reporter?), close it. You should also modify the title, so that others get
a quick idea that this is about power supply and whether their problem is
related...

> I on the other hand am working with a 4-5 year old Pentium IV Prescott
I expect it doesn't support SpeedStep at all (without Enhanced you only got 2
steps), but I am not entirely sure. Theoretically you could read up the Intel
docs whether it's supported at all. If, you also could try some rudimentary
things in userspace, in this case it's IO and not MSR driven. But instead of
wasting the time to finally find out that Pentium IV wasted power like hell and
there is not much you can do about that, you better invest some bugs into a new
cheap board and a new processor...

--- Comment #24 from vyncere <vyncere@gmail.com>  2010-11-12 19:09:35 ---
Hi all,

My personal experience may help too. I had the same problem with my Thinkpad
T410 (Core i5 520 M). With kernel 2.6.36, I had to set the "Performance"
Profile in my BIOS, for AC/DC power and Battery mode, instead of "Power-saving
/ Balanced / etc.". After that, the bios_limit managed to reach the max value,
2.40 GHz instead of 1.20GHz, and cpufreq managed to do its job.

But it's not the only thing. This observation was made with my battery plugged
on my laptop, with AC/DC power. Another day, without battery, I was very
surprised when I saw that the bios_limit was still stuck to 1.20GHz (!). I
think it's a BIOS related problem, very similar to the previous power supply
case. But fortunately, "processor.ignore_ppc=1" boot parameter does perfectly
the job. (Phew !!!)

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
