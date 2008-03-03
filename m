From: bugme-daemon@bugzilla.kernel.org
Subject: [Bug 10144] Wrong cpufreq speeds detected when overclocking (speeds
	reported using stock FSB, not overclocked)
Date: Mon,  3 Mar 2008 03:37:27 -0800 (PST)
Message-ID: <20080303113727.C20C9108066@picon.linux-foundation.org>
References: <bug-10144-3570@http.bugzilla.kernel.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <bug-10144-3570@http.bugzilla.kernel.org/>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
To: cpufreq@www.linux.org.uk

http://bugzilla.kernel.org/show_bug.cgi?id=10144





------- Comment #10 from knuckles@gmail.com  2008-03-03 03:37 -------
Forgive me if what i'm saying is stupid and obvious, but that site mentions
that "Other than measuring the speed every time a transition occurred (which
isn't feasible as it would incur a noticable performance overhead), it isn't
possible for cpufreq to know the current speed if it doesn't match what the
BIOS tables tell it that multiplier maps to."

My understanding is that speedstep works by lowering the cpu multiplier, while
keeping other things constant (not sure about proc voltage, but they don't
matter much to this problem), so I have displayed 1.2, 1.6 and 2.0 ghz
corresponding to the even multipliers 6x, 8x and 10x on my processor (not sure
why the odd ones aren't used).

Now if we were to get the real maximum speed (real_max_speed), that is
multiplier * frontsidebus, and divide it by the maximum speed on the bios
tables (bios_max_speed), we would get basically
(multipler/multiplier)*(overclockedFSB/ratedFSB). Now overclockedFSB/ratedFSB
is a constant because speedstep doesn't touch the fsb, in my case it is 313/200
= 1.565.

Wouldn't it be possible to obtain this constant once, and then use it to
correct the shown possible speeds? Eg, instead of 1.2, 1.6, 2.0 as reported by
the bios, we would have 1.2*constant, 1.6*constant, 2.0*constant ghz, that
should be the correct speed the processor is working at, when overclocked.

When not overclocked, constant = 1, so no problem there (probably it would be
1.0000001 or something like that, but there could be a test and only consider
the difference if it's greater than x %).

Again, sorry if none of this makes sense, maybe i'm reading it wrong :)


-- 
Configure bugmail: http://bugzilla.kernel.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug, or are watching the assignee.
