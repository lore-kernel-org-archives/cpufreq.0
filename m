From: Steffen Hein <steffen-hein@gmx.de>
Subject: Re: Pentium-M minimum clock-freq
Date: Fri, 2 Apr 2004 19:26:28 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <200404021926.28812.steffen-hein@gmx.de>
References: <200404021824.10912.steffen-hein@gmx.de>
	<20040402164459.GB7034@dominikbrodowski.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
In-Reply-To: <20040402164459.GB7034@dominikbrodowski.de>
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
To: cpufreq@www.linux.org.uk

On Friday 02 April 2004 18:44, Dominik Brodowski wrote:
> 'cause the other OS's behaviour is broken, IMHO. It (also) "sells" you
> throttling as "speedstep": Throttling means the processor is stopped for
> short times.

Is that compareable with the good-old "hlt" instruction?

> Actual speedstep states for the 1.5ghz
> Pentium-M are 600, 800, 1000, 1200, 1400 and 1500 MHz.

OK, good to know. I just was confused by the mhz Numbers "the other OS[tm]" 
gave me.

BTW: I'm not familiar with the current ACPI-style power-management-stuff, but 
would it make sense to use the HLT instruction together with Speedstep? How 
can it be enabled on ACPI-systems? ("do cpu idle calls when idle" is 
connected to apm in the kernel) Or isn't it useful anymore with ACPI?

 ~sth
