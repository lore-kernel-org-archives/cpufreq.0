From: aeriksson2@fastmail.fm
Subject: speedstep_smi & psmouse problems?
Date: Thu, 20 May 2004 17:10:10 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040520151011.6F8694137@latitude.mynet.no-ip.org>
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


installing the 2.6.6 kernel I noticed that the
CONFIG_X86_SPEEDSTEP_RELAXED_CAP_CHECK workaround is now included
(thanks!). I took the time to revisit my cpufreqd setup and I
discovered that there were some config changes I needed to make, and
that it wasn't currently running. Having fixed that, I noticed that
everything worked well, and the freq did change as requested. All well
and good.

However, now I find that the mouse is jumpy (as was reported in the
~2.6.2 days) and I get tons of:

psmouse.c: Wheel Mouse at isa0060/serio1/input0 lost synchronization,
throwing 2 bytes away.

in the kernel log. Is there a known case of problems between the -smi
driver's way of doing things, and eg. timing related stuff in the
psmouse driver? I've disabled cpufreqd and it _seems_ to make the
mouse healthy again...

/Anders
