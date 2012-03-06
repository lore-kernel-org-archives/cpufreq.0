From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 42648] Frequencies higher than 1.5 GHz are not available for
 AMD A8-3500M
Date: Tue, 6 Mar 2012 22:11:30 GMT
Message-ID: <201203062211.q26MBUlo027245@bugzilla.kernel.org>
References: <bug-42648-12968@https.bugzilla.kernel.org/>
Mime-Version: 1.0
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <bug-42648-12968@https.bugzilla.kernel.org/>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=42648


Thomas Renninger <trenn@suse.de> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |cpufreq@vger.kernel.org,
                   |                            |trenn@suse.de




--- Comment #6 from Thomas Renninger <trenn@suse.de>  2012-03-06 22:11:29 ---
I guess this AMD A8-3500M is a family 12h CPU (/proc/cpuinfo, cpu family ->
18)?
If yes (or if it's fam14h, cpu family -> 20), can you give latest cpupower
monitor tool a try from here:
git clone git://git.kernel.org/pub/scm/linux/kernel/git/brodo/cpupowerutils.git
cd tools/power/cpupower
make    # make sure pciutils-devel or whatever provides pci.h is installed
./cpupower monitor

Do you get a fam12h or fam14h monitor column?
If yes, you should be able to obtain additional info from HW which deep sleep
states were really entered, which core boosts, etc.
There is one special column: nbp1 (North Bridge P-state 1).
This one is only entered if graphics also enters power states.
It's a yes/no flag which always gets reset at measure beginning.
If you install cpupower, cpupower monitor --help should give you some more
details, otherwise man -l man/*.1 shows you some additional info.
When I tried, I realized that the kernel radeon driver prevented the platform
to enter NBP1 state (even with powersave profile). fglrx worked and NBP1 was
entered immediately.

-> I add the cpufreq list again. This one sounds interesting for others and
having this in the cpufreq archives for googling shouldn't be that bad.

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
