From: Daniel Drake <dsd@gentoo.org>
Subject: p4-clockmod reports frequencies faster than CPU
Date: Mon, 21 Aug 2006 17:11:11 +0100
Message-ID: <44E9DB1F.2020405@gentoo.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk
Cc: zwane@commfireservices.com

Hi,

A Gentoo user at http://bugs.gentoo.org/141234 reports that the 
p4-clockmod cpufreq driver reports bad frequencies for his 1300mhz 
Pentium 4 processor:

# cat sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
525000 787500 1050000 1312500 1575000 1837500 2100000

The last 3 are obviously wrong.

Unfortunately as this is a production system it's not easy to test other 
kernels, so this has only been reproduced on a Gentoo-patched 2.6.16. 
However the Gentoo patches don't modify cpufreq at all and are generally 
quite minimal.


/proc/cpuinfo output is here:
http://bugs.gentoo.org/attachment.cgi?id=92370&action=view

Does any more info need to be provided?

Thanks,
Daniel
