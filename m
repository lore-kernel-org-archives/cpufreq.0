From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: Problem powernow an Athlon 2600+ XP[solved]
Date: Thu, 27 May 2004 11:28:38 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040527092838.GQ4933@poupinou.org>
References: <6db520449336f134fa4831d9de3965b7@82.49.140.94>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <6db520449336f134fa4831d9de3965b7@82.49.140.94>
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
To: Forcarlo <forcarlo@email.it>
Cc: cpufreq@www.linux.org.uk

On Wed, May 26, 2004 at 11:42:38PM +0200, Forcarlo wrote:
> I have compiled powernow built-in in mm-sources-2.6.6-rc5 and I add
> "powernow_k7.powernow_acpi_force=1", "powernow_k7.acpi_force=1" don't work.
> Now I get 796,1 Mhz as a minimum freq instead of 1393 Mhz.
> 

You can fix this permanently if you send an output of dmidecode
(without the serial numbers, of course), or better create a
patch against linux-2.6/arch/i386/kernel/dmi_scan.c

Something like this:


--- linux-2.6/arch/i386/kernel/dmi_scan.c	2004/05/27 09:21:17	1.1
+++ linux-2.6/arch/i386/kernel/dmi_scan.c	2004/05/27 09:22:56
@@ -875,6 +875,12 @@ static __initdata struct dmi_blacklist d
 			NO_MATCH, NO_MATCH,
 			} },
 
+	{ acer_cpufreq_pst, "Foo", {
+			MATCH(DMI_SYS_VENDOR, "Bar"),
+			MATCH(DMI_BIOS_VERSION, "Baz"),
+			NO_MATCH, NO_MATCH,
+			} },
+
 #ifdef	CONFIG_ACPI_BOOT
 	/*
 	 * If your system is blacklisted here, but you find that acpi=force



Of course, that's _only_ an example.  The only thing that shall not
being modified is 'acer_cpufreq_pst'.

Cheers,

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
