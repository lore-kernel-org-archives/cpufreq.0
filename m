From: Dominik Brodowski <linux@dominikbrodowski.de>
Subject: Geode NX PowerNow
Date: Mon, 24 May 2004 15:02:26 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040524130226.GB7769@dominikbrodowski.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
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
To: paul.devriendt@amd.com, cpufreq@www.linux.org.uk

Dear Paul,

A few minutes ago I heard of the new Geode NX processors AMD is shipping.
Reportedly, they contain the "PowerNow!" technology. Is this powernow-k7 or
powernow-k8? If it's powernow-k8, does check_supported_cpu() detect it? If
it's powernow-k7, do the CPUID checks in check_powernow() work?

In addition, I think we should clarify some help texts in Kconfig [once the
issues mentioned above are resolved] to show the differences between
gx-suspmod and powernow-k{7,8} for Geode NX.

Thanks,
	Dominik
