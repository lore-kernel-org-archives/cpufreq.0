From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: cpufreq issue
Date: Tue, 29 Mar 2005 12:01:11 +1000
Message-ID: <1112061671.5768.3.camel@gaston>
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
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: Dominik Brodowski <linux@dominikbrodowski.net>
Cc: cpufreq@lists.linux.org.uk

Hi !

I'm trying to solve a long standing cpufreq issue on pmac. That includes
adding a suspend() callback in addition to the restore one, but that
also includes the need for me to switch to high speed on suspend. The
problem is that at this point, IRQs are disabled, which mean that
calling the notifier will BUG()... However, I must trigger the jiffies
adjustement...

What do you suggest ? Maybe I could have the core cpufreq suspend()
routine do a bit like resume(), and so right after it calls my driver
suspend(), compare the frequency with get() (if any) and update the
jiffies ? Or what ? The problem is that I need to make sure the machine
is in high speed before sleep for various HW reasons, and I must make
sure the jiffies are recalculated properly since some low level stuff
will rely on udelay() beeing "good enough" before cpufreq gets a chance
to resume and thus "fixup" the loops_per_jiffies ...

Ben.
