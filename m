From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: static freq table support for Pentium M Dothan
Date: Wed, 18 Aug 2004 11:44:22 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040818094422.GD29560@poupinou.org>
References: <E1Bwu3z-0007gV-4Q@mage.metaparadigm.com>
	<412280F0.8090900@giesskaennchen.de>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <412280F0.8090900@giesskaennchen.de>
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
To: Oliver Antwerpen <olli@giesskaennchen.de>
Cc: cpufreq@www.linux.org.uk

Hi,

On Tue, Aug 17, 2004 at 10:04:32PM +0000, Oliver Antwerpen wrote:
> I don't really know what to do. Do I have any advantages using 
> speedstep-centrino instead of acpi?

You may want BOTH actually.  acpi for a more aware power saving idle
loop (you can gather some statistics from /proc/acpi/processor/*/power)
and you may want speedstep-centrino in order to lower voltage (and as a
consequence the frequency of the processor).  You should'nt use the acpi
performance stuff because it's achieve the exact same thing than the
speedstep-centrino, but via a call to the BIOS instead to talk directly
to the hardware (in this case, via known MSRs).

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
