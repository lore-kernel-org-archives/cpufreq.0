From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 16072] [HP Pavilion dm1-1110ev] Cpufreq doesn't work at all (
 Intel Celeron U2300 )
Date: Sun, 24 Oct 2010 10:03:45 GMT
Message-ID: <201010241003.o9OA3j7t023325@demeter2.kernel.org>
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





--- Comment #21 from Patrick Viane <patrickviane@yahoo.com>  2010-10-24 10:03:34 ---
After a deeper look into the link provided by Thomas Renninger in Comment #14,
and into the datasheet (both of which I should have done in the first place
instead of skimming them, sorry for that), it's clear that an important point
is the reference to the datasheet, page 30, note 10, which states: "SU2300
processor operates at same core frequency in HFM and LFM" (HFM = Highest
Frequency Mode, LFM = Lowest Frequency Mode).  *If* the processor doesn't have
a Super Low Frequency Mode (SuperLFM) as stated on page 26 of the datasheet
(not really clear), the processor would indeed run at only one frequency.  So
it looks like "Enhanced Intel SpeedStep Technology" doesn't automatically imply
frequency scaling.

Without SuperLFM, voltage scaling and/or C-states seem to be the best
candidates to explain why battery life under Windows was longer than under
Linux (but I'm not the expert here).

The question in my previous comment about thermal management in situations
where one is not able to load p4-clockmod as a "driver of last resort", stems
from the following remark at https://patchwork.kernel.org/patch/7786/ and
similar comments elsewhere:
> This is one reason why in .30 the user interface for p4-clockmod is disabled.
> It'll only get throttled when ACPI goes into OMG I'M OVERHEATING mode,
> and ramp back up once it cools off.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
