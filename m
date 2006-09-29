From: Marco cusmai <cusmai@gmail.com>
Subject: Re: speedstep-ich issue
Date: Fri, 29 Sep 2006 21:49:42 +0000
Message-ID: <200609292149.42603.cusmai@gmail.com>
References: <200609291111.48598.cusmai@gmail.com>
	<20060929174035.GE13444@inferi.kami.home>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <20060929174035.GE13444@inferi.kami.home>
Content-Disposition: inline
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=m.gmane.org+glkc-cpufreq=m.gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
To: cpufreq@lists.linux.org.uk

On Friday 29 September 2006 17:40, Mattia Dongili wrote:
> On Fri, Sep 29, 2006 at 11:11:48AM +0000, Marco cusmai wrote:
> > Upgrading kernel form version 2.6.17.2 to 2.6.18 the cpufreq system makes
> >   strange things.. looking at dmesg (with debugging enabled for cpufreq)
> > it seems that after a while the system recognizes only one step of
> > frequency (the slowest) .. The CPU is a P3 that can change the frequency
> > from 730 MHz to 1.1 GHz, using the speedstep-ich driver. Tell me if you
> > need more informations..
>
> probably dmesg output and some kind of evidence of the problem you're
> reporting would be appreciated.
>
> Regards
Here it is some dmesg output with cpufreq.debug=2

speedstep-lib: x86: 6, model: b
speedstep-lib: ebx is 6
speedstep-ich: pmbase is 0x1000
speedstep-lib: trying to determine both speeds
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0xcd840020 0x0
speedstep-lib: speed is 1130500
speedstep-lib: previous speed is 1130500
speedstep-ich: read at pmbase 0x1000 + 0x50 returned 0x0
speedstep-ich: writing 0x1 to pmbase 0x1000 + 0x50
speedstep-ich: read at pmbase 0x1000 + 0x50 returned 0x1
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0xc5040020 0x0
speedstep-lib: speed is 731500
speedstep-ich: change to 731 MHz succeeded
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0xc5040020 0x0
speedstep-lib: speed is 731500
speedstep-lib: low speed is 731500
speedstep-ich: read at pmbase 0x1000 + 0x50 returned 0x1
speedstep-ich: writing 0x0 to pmbase 0x1000 + 0x50
speedstep-ich: read at pmbase 0x1000 + 0x50 returned 0x0
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0xcd840020 0x0
speedstep-lib: speed is 1130500
speedstep-ich: change to 1130 MHz succeeded
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0xcd840020 0x0
speedstep-lib: speed is 1130500
speedstep-lib: high speed is 1130500
speedstep-lib: transition latency is 0 uSec
speedstep: frequency transition measured seems out of range (0 nSec), falling 
back to a safe one of 500000 nSec.
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0xcd840020 0x0
speedstep-lib: speed is 1130500
speedstep-ich: detected 1130500 kHz as current frequency
speedstep-ich: currently at high speed setting - 1130 MHz
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0xcd840020 0x0
speedstep-lib: speed is 1130500
speedstep-ich: detected 1130500 kHz as current frequency
speedstep-ich: transiting from 1130500 to 1130500 kHz

Here starts the userspace program (cpufreqd):

speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0xcd840020 0x0
speedstep-lib: speed is 1130500
speedstep-ich: detected 1130500 kHz as current frequency
speedstep-ich: transiting from 1130500 to 1130500 kHz
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0xcd840020 0x0
speedstep-lib: speed is 1130500
speedstep-ich: detected 1130500 kHz as current frequency
speedstep-ich: transiting from 1130500 to 731500 kHz
speedstep-ich: read at pmbase 0x1000 + 0x50 returned 0x0
speedstep-ich: writing 0x1 to pmbase 0x1000 + 0x50
speedstep-ich: read at pmbase 0x1000 + 0x50 returned 0x1
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0xc5040020 0x0
speedstep-lib: speed is 731500
speedstep-ich: change to 731 MHz succeeded
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0xc5040020 0x0
speedstep-lib: speed is 731500
speedstep-ich: detected 731500 kHz as current frequency
speedstep-ich: transiting from 731500 to 731500 kHz
speedstep-lib: P3 - MSR_IA32_EBL_CR_POWERON: 0xc5040020 0x0
speedstep-lib: speed is 731500
speedstep-ich: detected 731500 kHz as current frequency
speedstep-ich: transiting from 731500 to 731500 kHz

from now on the frequency stays on 731500 kHz.. 

I've tried to read informations from the sys interface:

cat scaling_available_frequencies : 1130500 731500
cat scaling_min_freq : 731500
cat scaling_max_freq : 731500

trying to change frequency through scaling_setspeed does nothing.

I've also noticed these errors during ACPI startup

acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
decode_hpp: Could not get hotplug parameters. Use defaults
acpiphp: Slot [1] registered
acpiphp_ibm: ibm_find_acpi_device:  Failed to get device 
information<3>acpiphp_ibm: ibm_find_acpi_device:  Failed to get device 
information<3>acpiphp_ibm: ibm_acpiphp_init: acpi_walk_namespace failed
