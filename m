From: Thomas Renninger <mail@renninger.de>
Subject: ondemand governor and passive cooling broken?
Date: Wed, 03 Aug 2005 20:17:07 +0200
Message-ID: <42F10A23.6020107@renninger.de>
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
To: cpufreq@lists.linux.org.uk

Machine is a Thinkpad with a Pentium M ~1700MHz running with the speedstep-centrino module.

Something seems to be wrong with the cooling system and
the CPU temp goes up from 50 C to 90 C in about a minute.

With the userspace governor the machine stays at 1200 MHz on full load
and bounces around 80C (passive trip point), that's how it should be.

However, passive cooling seems to be broken with current kernels
and ondemand governor?
Machine stays at 1700 MHz until critical shutdown (94 C).

Is passive cooling supposed to work with the ondemand governor?
If yes, can someone confirm seeing it working with old kernels and
the speedstep-centrino module?

Thanks,

    Thomas
