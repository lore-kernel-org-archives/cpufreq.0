From: Stefan Tomanek <stefan@pico.ruhr.de>
Subject: Re: static freq table support for Pentium M Dothan
Date: Wed, 8 Sep 2004 19:59:30 +0000 (UTC)
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <loom.20040908T215751-536@post.gmane.org>
References: <E1Bwu3z-0007gV-4Q@mage.metaparadigm.com>
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
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@www.linux.org.uk

Michael Clark <mclark <at> metaparadigm.com> writes:

> I personally need this patch as I don't use ACPI so can't use the
> experimental ACPI freq/voltage tables support as ACPI doesn't work well
> enough for me on my Thinkpad T42.

This patch is great, ACPI only reports two frequencies on my Travelmate 292
(Dothan 1.5), 600 and 1500 Mhz. With this patch I can use all available
frequencies. Will it be integrated into the official speedstep-centrino module?
