From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 16072] [HP Pavilion dm1-1110ev] Cpufreq doesn't work at all (
 Intel Celeron U2300 )
Date: Fri, 22 Oct 2010 21:49:38 GMT
Message-ID: <201010222149.o9MLncND017659@demeter1.kernel.org>
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





--- Comment #16 from Robert Bradbury <robert.bradbury@gmail.com>  2010-10-22 21:48:19 ---
On Fri, Jun 25, 2010 at 5:02 AM, <bugzilla-daemon@bugzilla.kernel.org>wrote:

> https://bugzilla.kernel.org/show_bug.cgi?id=16072
>
> --- Comment #2 from Markos Chandras <hwoarang@gentoo.org>  2010-06-25
> 09:01:42 ---
> Thanks for the quick tip, but I have found multiple references over the
> inet,
> complaining about broken support on this kinda of CPU. Is it possible that
> all
> of them had a broken bios? Initially, I assumed that this cpu is quite new
> and
> kernels developers didn't have time to add support for it
>

Markos, the CPU is very old (~5+ years).  There are still CPU/BIOS
combinations wch may be coming out which do not properly support the ACPI
power saving options [1] -- and thus one must fall back on the old
p4-clockmod power saving features.  Which did indead work and should not be
effectively disabled as has been the case with more recent releases of
Linux.

Please feel free to contact me for the specific modiification in
p4-clockmod.c which should be removed in order to provide the normal power
saving features.

Best,
Robert

1. It is a very complex situation in terms of what the CPUs are capable of
and what the BIOS is capable of (in terms of managing power conservation).
 In terms of my current read of the Linux code these are in two separate
realms from a development standpoint.  In an ideal world everything would be
going through ACPI and it would manage power use.  In reality that world
does not exist and one should be able to deal with it.  Thus problems with
p4-clockmod.c.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
