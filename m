From: paul.devriendt@amd.com
Subject: RE: Athlon 64 complains of frequency mismatch
Date: Wed, 23 Jun 2004 00:43:51 -0700
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <84EA05E2CA77634C82730353CBE3A8432698C5@SAUSEXMB1.amd.com>
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
To: elf@buici.com, cpufreq@www.linux.org.uk

> Perhaps this is an addition to the FAQ:
> 
>  Q609: AMD Cool&Quiet CPU won't load the powernow-k? driver.  Why?
> 
>  A609: The powernow driver gets it's information about processor
>        states from the BIOS's reported ACPI control data.  If the
>        powernow driver won't load it may be because Cool&Quiet hasn't
>        been enabled in the BIOS.  Make sure that BIOS settings for a
>        PowerNow or a Cool&Quiet option are enabled.
> 
> Or, maybe the driver should output a kernel message about BIOS
> settings.

Where is the FAQ ? I would like to read it :)

How about having the driver put out a message referring to go 
read the FAQ ?

Paul.
