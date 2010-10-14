From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Thu, 14 Oct 2010 09:11:58 GMT
Message-ID: <201010140911.o9E9BwTi012147@demeter1.kernel.org>
References: <bug-19702-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-19702-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=19702





--- Comment #9 from Thomas Renninger <trenn@suse.de>  2010-10-14 09:11:54 ---
Mobusby: You have another problem which is BIOS related.
Best check for the latest BIOS. Here is a similar bug (but the root cause in
BIOS is probably different). BIOS limits the frequ on purpose, you have to find
out why...
Best also check your BIOS settings (best after a upgrade).
Some things to check:
Temperature might be related, AC/battery, dirty fan slot, only happens after
suspend (disk/ram)?
If nothing helps, processor.ignore_ppc=1 will ignore the limit from BIOS.
If you tried that far, then please open a new bug and attach dmesg and acpidump
output and assign it to me.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
