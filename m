From: Bruno Ducrot <ducrot@poupinou.org>
Subject: Re: SMP CPUfreq support in Linux kernel mainline??
Date: Mon, 31 Jan 2005 21:27:25 +0100
Message-ID: <20050131202725.GM1145@poupinou.org>
References: <E1CvhY8-0007pa-AJ@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@ZenII.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <E1CvhY8-0007pa-AJ@parcelfarce.linux.theplanet.co.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Erich Boleyn <erich@uruk.org>
Cc: cpufreq@ZenII.linux.org.uk

On Mon, Jan 31, 2005 at 11:49:09AM -0800, Erich Boleyn wrote:
> 
> Greetings all,
> 
> I am having a problem getting SMP CPUfreq support to function correctly
> on recent Linux kernels, and wanted to know if what I am seeing is a
> known bug or infrastructure problem.
> 
> Setup:  dual-Opteron 250 (and right revision, won't go into that yet ;-)
> 	with latest Powernow-K8 driver code hacked to pretend a BIOS is
> 	present enabling the P-states directly, but NOT putting in ACPI
> 	P-state tables and associated cruft.
> 
> Caveat: This requires a bit of special sauce as motherboard vendors in
> 	general haven't released BIOSes that support these configurations,
> 	but my understanding is that it's coming down the pipeline.
> 
> OK, on recent kernels (most of which I have tested are 2.6.8 or later
> vintage Fedora Core 3 and SuSE 9.2 Pro kernels), I can get both processors
> to perform frequency/voltage transitions reliably just fine.
> 
> BUT I am seeing a consistent problem on every kernel I've tried.  Programs
> seem to mostly work, but...
> 
> It appears that the cpu TSC (timestamp counter) is getting out of sync
> between the two processors, yet the Linux kernel isn't trying to correct
> for this.  (on Opterons, the TSC runs at core frequency)

Thats the problem:

ducrot@poupoune:~/msr-tools-1.1.2$ cpufreq-info
cpufrequtils 0.1-pre2: cpufreq-info (C) Dominik Brodowski 2004
Report errors and bugs to linux@brodo.de, please.
analyzing CPU 0:
  driver: powernow-k8
  hardware limits: 1000 MHz - 2.20 GHz
  available frequency steps: 2.20 GHz, 2.00 GHz, 1000 MHz
  available cpufreq governors: powersave, userspace, performance
  current policy: frequency should be within 1000 MHz and 2.20 GHz.
                  The governor "performance" may decide which speed to use
                  within this range.
  current CPU frequency is 2.20 GHz.
analyzing CPU 1:
  driver: powernow-k8
  hardware limits: 1000 MHz - 2.20 GHz
  available frequency steps: 2.20 GHz, 2.00 GHz, 1000 MHz
  available cpufreq governors: powersave, userspace, performance
  current policy: frequency should be within 1000 MHz and 2.20 GHz.
                  The governor "performance" may decide which speed to use
                  within this range.
  current CPU frequency is 2.20 GHz.
ducrot@poupoune:~/msr-tools-1.1.2$ a=`sudo ./rdmsr -p 0 -d 0x10`; sleep 1; b=`sudo ./rdmsr -p 0 -d 0x10`; expr $b - $a
2208108953
ducrot@poupoune:~/msr-tools-1.1.2$ sudo cpufreq-set -g powersave
ducrot@poupoune:~/msr-tools-1.1.2$ a=`sudo ./rdmsr -p 0 -d 0x10`; sleep 1; b=`sudo ./rdmsr -p 0 -d 0x10`; expr $b - $a
1006333430

At this stage, the TSC cant accross CPU anymore.
I'm not sure how we can handle that properly.

-- 
Bruno Ducrot

--  Which is worse:  ignorance or apathy?
--  Don't know.  Don't care.
