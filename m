From: Eric Oosting <eoosting@yahoo.com>
Subject: cpufreq change appears to cause ps2 mouse hangs
Date: Mon, 25 Apr 2005 12:04:59 -0700 (PDT)
Message-ID: <20050425190459.34415.qmail@web53603.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@lists.linux.org.uk

I wanted to bring a problem I am having to your
attention in hopes that
you might be able to help me correct my problem.

I have a dell latitude C600 laptop with a PIII 1Ghz
proc running the
latest Ubuntu (5.04) release and 2.6.10. Ubuntu uses
powernowd to adjust
frequency scaling.

My problem is that whenever powernowd changes the
frequency on my cpu my
mouse hangs for about a second with the following
error to
/var/log/messages:

Apr 22 20:58:44 localhost kernel: psmouse.c: TouchPad
at isa0060/serio1/input0 lost synchronization,
throwing 4 bytes away.
Apr 22 20:58:44 localhost kernel: psmouse.c: TouchPad
at isa0060/serio1/input0 lost sync at byte 1
Apr 22 20:58:44 localhost kernel: psmouse.c: TouchPad
at isa0060/serio1/input0 lost sync at byte 1
Apr 22 20:58:44 localhost kernel: psmouse.c: TouchPad
at isa0060/serio1/input0 - driver resynched.
Apr 22 21:06:34 localhost kernel: psmouse.c: TouchPad
at isa0060/serio1/input0 lost synchronization,
throwing 1 bytes away.
Apr 22 21:06:34 localhost kernel: psmouse.c: TouchPad
at isa0060/serio1/input0 lost sync at byte 1

This also happens if I have a standard USB mouse
plugged in. If I disable
powernowd I don't get any hickups. I don't believe the
problem is directly
because of powernowd because I am able to reproduce
the problem by running
"echo 700000 >
/sys/device/system/cpu/cpu0/cpufreq/scaling_setspeed"
or
setting it back to 1000000.   

Have you any ideas on how I might solve or mitigate
the problems I am
having? The cpu frequency scaling capabilities of the
2.6 kernel are
wonderful and I would much prefer to fix the problem
then disable any
tools that would change the scaling dynamically.

Thanks,
Eric


__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 
