From: Bryan O'Sullivan <bos@serpentine.com>
Subject: No life from acpi-cpufreq, Pentium D 930, x86_64
Date: Tue, 19 Sep 2006 21:55:12 -0700
Message-ID: <1158728112.19359.18.camel@pelerin.serpentine.com>
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

I'm running the 2.6.17-1.2174_FC5 x86_64 kernel from FC5 updates on a
Dell PowerEdge 830 server with a Pentium D 930 inside.  I can modprobe
acpi_cpufreq, but it doesn't do anything - there are no kernel log
messages, no new sysfs files to look at, nothing in /proc/acpi.

cpufreq-info tells me that I have no cpufreq support, but I had kind of
figured that out already :-(

Is there something more I should be doing?

	<b
