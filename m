From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 23412] Only the lowest CPU frequency available on laptop
 working from battery.
Date: Fri, 17 Dec 2010 14:10:29 GMT
Message-ID: <201012171410.oBHEATdE001999@demeter1.kernel.org>
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





--- Comment #4 from Thomas Renninger <trenn@suse.de>  2010-12-17 14:09:35 ---
This is because previous kernels did not read out the BIOS limit at
processor.ko load time which was wrong and got fixed.

The reason why the BIOS limits freq can be totally different, e.g. here:
https://bugzilla.kernel.org/show_bug.cgi?id=16362
It gets limited on ThinkPads if you work with a 65 Watts AC adapter without
battery.

Or you might want to read the last comments of vyncere in this bug (the bug is
about something else, but that was not clear at the beginning):
https://bugzilla.kernel.org/show_bug.cgi?id=19702

-------------------
Thank you very much Thomas for your hint. As you suggested me to check the BIOS
limit (which was 1.20 GHz in my case), this morning I set in my BIOS for all
modes (AC/DC Power + Battery) the "Performance" profile, instead of
"Power-saving" one.

Now the BIOS limit is 2.40GHz, and cpufreq manage to do his job, without any
patches (2.6.36).
-------------------

I looked at quite some "Bios limits my frequency" bugs and the kernel always
behaved correct. If your ACPI tables are not busted (and you should see this by
some obvious ACPI Error messages in dmesg), I suggest you look up your BIOS
setting, your mainboard manual or update the BIOS if it does not help.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
