From: Jan Rychter <jan@rychter.com>
Subject: Speedstep: how often?
Date: Thu, 18 Sep 2003 23:54:45 -0700
Sender: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Message-ID: <m2ekydtgi2.fsf@tnuctip.rychter.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=unsubscribe>
List-Archive: <http://www.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@www.linux.org.uk>
List-Help: <mailto:cpufreq-request@www.linux.org.uk?subject=help>
List-Subscribe: <http://www.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@www.linux.org.uk?subject=subscribe>
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: cpufreq@www.linux.org.uk

How often does it make sense to "speedstep" Intel CPUs?

I do realize that the question is a little vague -- please allow me to
specify some context. XEmacs is the most frequently used application on
my laptop. I've been trying various power management daemons that change
the CPU frequency. However, they all base their decisions on past CPU
usage, which is totally wrong in my case. I need a speed boost when I
press some keys or enter a short-lived CPU-intensive function. Usually
when the daemon kicks in, it is already too late.

So, I've been thinking about instrumenting XEmacs (or parts of it) so
that it can tell the power management layer that it is going to need the
CPU now, and tell it that it's mostly done with the CPU.

Question is: how often does it make sense to do that, both from a
performance and power point of view? E.g. there is probably both a delay
penalty and a power hit when you speedstep a CPU?

Can I speedstep up/down at every keystroke (which produces a change at
up to 20 times a second)? Once per second? Or even less often?

I'm currently interested in the P-IIIM, but answers for any CPU are
appreciated.

--J.
