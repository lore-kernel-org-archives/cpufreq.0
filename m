From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 16072] [HP Pavilion dm1-1110ev] Cpufreq doesn't work at all (
 Intel Celeron U2300 )
Date: Sat, 23 Oct 2010 06:03:36 GMT
Message-ID: <201010230603.o9N63a6n023784@demeter1.kernel.org>
References: <bug-16072-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-16072-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D16072





--- Comment #19 from Patrick Viane <patrickviane@yahoo.com>  2010-10-23=
 06:03:16 ---
Same sentiment here (sadness) as expressed by Markos Chandras in Commen=
t #17.

The CPU is clearly capable of frequency scaling (and voltage scaling).

Please consider the following:
> Comment #14
> It came out this type of CPU is not speedstep capable
Somewhat misleading: the CPU is "Enhanced Intel SpeedStep=C2=AE Technol=
ogy" capable,
and should (imo) be handled by the acpi-cpufreq driver.=20

> You might want to verify with the Intel CPU sheet the guy found.
I did: please see for yourself at
http://www.intel.com/design/mobile/datashts/321111.pdf

> Comment #15
> The machine is a standard HP Pavilion A630N machine
Incorrect: see discription of bug: "[HP Pavilion dm1-1110ev] Cpufreq do=
esn't
work at all ( Intel Celeron U2300 )".  AFAIK this notebook was introduc=
ed in Q1
2010. (As were many other notebooks using this CPU)

> Comment #16
> Markos, the CPU is very old (~5+ years).=20
Incorrect: launch date of this CPU was Q3 '09; please see:
http://ark.intel.com/Product.aspx?id=3D42779
These CPU's are still being sold/implemented.

> Comment #18
> Sigh, a p4_clockmod discussion again.
Yes, I think the correct discussion should mostly be about acpi-cpufreq=
=2E

But just to make certain: in case of overheating, where does linux cont=
rol the
thermal protection of these CPU's? Especially now, WITHOUT drivers?  If=
 the
answer here is p4_clockmod (or acpi-cpufreq), one might even think abou=
t
raising the importance of this bug, considering the potential overheati=
ng
isues, which are of course not uncommon in notebooks.

>  machine is a
> > standard HP Pavilion A630N machine (presumably which hundreds of th=
ousands
> > were manufactured in the 2003-2005 time frame).
> Which does not support CPU frequency scaling, where is the problem?
> The CPU itself simply cannot do it.
I hope it is clear by now that the SU2300 in the HP Pavilion dm1-1110ev=
 *DOES*
support CPU frequency scaling.

> Hmm, this machine does not even support C2...
Luckily for us, the SU2300 supports C1/AutoHALT, C1/MWAIT, C2, C3 and C=
4,
otherwise we would all (presumably) be forced to go back to running Win=
dows on
our notebooks.

I hope this bug can be truly resolved, if not, can anyone point me to t=
he=20
"documentation" with which to "Resolve" this bug, as mentioned in the b=
ug
"Status"?

Thanks.

--=20
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=3Demai=
l
------- You are receiving this mail because: -------
You are the assignee for the bug.