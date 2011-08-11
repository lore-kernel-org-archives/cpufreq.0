From: bugzilla-daemon@bugzilla.kernel.org
Subject: [Bug 19702] i5-450M CPU gets stuck in low/lowest state
Date: Thu, 11 Aug 2011 13:00:05 GMT
Message-ID: <201108111300.p7BD05YC022007@demeter1.kernel.org>
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


David Tomaschik <david@systemoverlord.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |david@systemoverlord.com




--- Comment #53 from David Tomaschik <david@systemoverlord.com>  2011-08-11 12:59:49 ---
I believe I'm having a similar problem.  My hardware is a Dell Latitude E5420
with an i5-2520M CPU.  I have the latest Dell BIOS for this system.  I'm
currently on the Ubuntu kernel 2.6.38-10-generic, and after I resume from
suspend, CPU frequency scaling no longer works.  Before suspending,
cpufreq-aperf shows sane values.  Afterwards, it gives frequencies of about
625MHz:
cpufreq-aperf
CPU    Average freq(KHz)    Time in C0    Time in Cx    C0 percentage
000    0625250            00 sec 077 ms    00 sec 922 ms    07
001    0625250            00 sec 007 ms    00 sec 992 ms    00
002    0600240            00 sec 098 ms    00 sec 901 ms    09
003    0625250            00 sec 002 ms    00 sec 997 ms    00

I believe that, because of this, the cpufreq scaling won't bump things up. 
"That is the reason why the cpufreq subsystem, taking aperf values to
calculate the next frequency into account never raises the frequency."

Any idea why it would only occur after a suspend/resume cycle and what I can do
to fix the issue?

-- 
Configure bugmail: https://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
