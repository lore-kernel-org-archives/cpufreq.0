From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 23412] Only the lowest CPU frequency available on laptop
 working from battery.
Date: Mon, 20 Dec 2010 09:47:21 GMT
Message-ID: <201012200947.oBK9lLLR002667@demeter1.kernel.org>
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

--- Comment #8 from Vladimir <v_2e@ukr.net>  2010-12-20 09:46:30 ---
(In reply to comment #7)
> > I have found a BIOS feature "Andvanced power management"
> Sounds related.
  Well, I thik so too, but I tried to switch this option on/off several times,
and naven't noticed any changes in anything. This feature is also not
documented in the User's Manual for my laptop.

> Still, it's not a kernel, but a BIOS/platform issue.
  Yes. Now I'm sure this isn't a kernel issue.
  I tried to add the "processor.ignore_ppc=1" string to the kernel parameters
at startup, just like you suggested, and it really gave me access for all the
CPU frequencies, which is just great! Thank you for this tip! :)

> As said, all initial BIOS limits were ignored by the kernel for quite some time
> and this got fixed. Have you looked for BIOS updates and their changelogs
> already? If not, this would be the next step.
  Yes, I have looked for the BIOS updates, but there are no updates to fix this
strange behaviour.
  Moreover, I have been searching trough some fora these days and I see people
saying that MSI (my laptop vendor) knows about this problem and says that "this
is a company design policy of this model". This means they refuse to fix the
bug in their BIOS and release an update, I guess.
  There are also many Windows users who experience the same problem and they
found some software to tweak this on Windows too.

> If this also does not help, please attach acpidump output (with the new BIOS!).
> Be aware that this is very low prio bug, as it's very likely that the culprit
> (most likely this is even intended) comes from the BIOS.
  Well, now it certainly is BIOS to blame. Thus it seems to me this bug may be
closed already.  
  I think that now it is a question of spreading the information about
"processor.ignore_ppc" parameter. At least for operating systems using Linux as
their kernel.
  Oh, and by the way, I have found on some Debian-related forum that this
behaviour may be tweaked during run-time also by executing the following
command:
    echo 1 > /sys/module/processor/parameters/ignore_ppc

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
