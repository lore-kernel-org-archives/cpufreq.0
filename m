From: Stefan Seyfried <seife@gmane0305.slipkontur.de>
Subject: Re: ondemand governor
Date: Sat, 25 Sep 2004 08:41:27 +0200
Sender: cpufreq-bounces@www.linux.org.uk
Message-ID: <20040925064127.GB24558@message-id.gmane0305.slipkontur.de>
References: <88056F38E9E48644A0F562A38C64FB6002F2B01B@scsmsx403.amr.corp.intel.com>
Mime-Version: 1.0
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@www.linux.org.uk>
Content-Disposition: inline
In-Reply-To: <88056F38E9E48644A0F562A38C64FB6002F2B01B@scsmsx403.amr.corp.intel.com>
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
To: "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@www.linux.org.uk

On Fri, Sep 24, 2004 at 04:55:31PM -0700, Pallipadi, Venkatesh wrote:

> By any chance you have enabled local APIC (timer interrupts) and also
> using C3-states?

C3 -> yes, lapic -> no.
> 
> I have one known issue where ondemend doesn't work properly with the
> above configuartion.

strolchi:~ # cat /proc/acpi/processor/CPU0/power
active state:            C3
default state:           C1
bus master activity:     00120000
states:
    C1:                  promotion[C2] demotion[--] latency[000] usage[04803900]
    C2:                  promotion[C3] demotion[C1] latency[050] usage[50268288]
   *C3:                  promotion[--] demotion[C2] latency[050] usage[01882935]
strolchi:~ # cat /proc/interrupts
           CPU0
  0:   61430953          XT-PIC  timer
  1:      68156          XT-PIC  i8042
  2:          0          XT-PIC  cascade
  7:     836390          XT-PIC  Intel 82801DB-ICH4
  9:         14          XT-PIC  acpi
 11:     759116          XT-PIC  yenta, yenta, ehci_hcd, uhci_hcd, uhci_hcd, uhci_hcd, eth0
 12:     652352          XT-PIC  i8042
 14:     225938          XT-PIC  ide0
 15:     455716          XT-PIC  ide1
NMI:          0
LOC:          0
ERR:          0
MIS:          0
-- 
Stefan Seyfried
