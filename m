From: Sebastian Witt <se.witt@gmx.net>
Subject: cpufreq driver for nForce2
Date: Thu, 03 Jun 2004 15:32:16 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <40BF2860.1070502@hasw.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@www.linux.org.uk

Hello,

I'm writing a cpufreq driver for nForce2 mainboards which changes the 
FSB instead of using any power-save functions of the CPU.

The good thing is: It works with all CPUs on nForce2 plattforms, the bad 
thing: currently the minimum FSB is on the most boards at boot FSB - 60.
But I think with a high multiplier the CPU frequency range is high enough.

A test version is available at: 
http://www.hasw.net/linux/cpufreq-nforce2-0.1.tar.bz2

Tested with kernel 2.6.6.

It would be nice to hear suggestions, bug reports, etc.

Regards,
Sebastian
