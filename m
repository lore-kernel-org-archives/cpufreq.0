From: cpufreq@mnlist.ml1.net
Subject: opteron smp hangs
Date: Sun, 02 Apr 2006 08:59:33 +0000
Message-ID: <442F9275.4040205@mnlist.ml1.net>
Reply-To: cpufreq@mnlist.ml1.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

Hi, since just before Christmas I have been experiencing immediate hangs
when my system scales down to 1000 MHz at a default 1200 Mv.

After investigating it was thought that it was actually a problem with
libata see kernel.org bug

http://bugzilla.kernel.org/show_bug.cgi?id=5770

I have been conducting more tests and am now thinking that this is a
powernow-k8 problem after all, a bios problem or just possibly a
hardware issue.

I have found a patch that enables me to override bios voltages and if I
set the minimum voltage to 1300 instead of the default 1200 things seems
much better.

I also have found some code that allows me to set the voltage from the
command line.  With this and cpufreq-set.  I find that if I set both
cpu's to 1000 MHz and once both are at that frequency drop the voltage
there is no longer an immediate hang even at 1100 volts.  This seems to
indicate that the chips are fine.

I'm therefore wondering if my opteron 248's are supposed to scale
independently.  Is there a simple way to make powernow scale the cpu's
in tandem rather than independently to test this theory.

Thanks for any insight on this matter.

Mark
