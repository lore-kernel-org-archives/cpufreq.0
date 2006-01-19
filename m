From: Thomas Renninger <mail@renninger.de>
Subject: DELL 600/800 - PPC frequency change issues
Date: Thu, 19 Jan 2006 18:59:22 +0100
Message-ID: <43CFD37A.1040402@renninger.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: cpufreq@lists.linux.org.uk
Cc: Dominik Brodowski <linux@dominikbrodowski.de>

When unplugging the AC adapter on these machines
following happens in BIOS:

- ACPI processor event fired, frequencies get limited
  to the lowest one(600 MHz) and BIOS already sets lowest freq.
- when waiting about 10 seconds another ACPI processor 
  event is fired, and all frequencies are available again,
  highest freq(1700 MHz) is set.
- when plugging in ac adapter before waiting 10 seconds
  ACPI processor event is happening immediately and all
  frequencies are available again, highest freq(1700 MHz) is set.


I found these bugs in kernel:

- speedstep centrino driver does not recognise that BIOS
  changed the frequency behind it's back.
  It tells you that 600 MHz are already set, and does not invoke
  PRE/POST transition validation. 
  On next frequency settings, the frequency is "out_of_sync" and
  the validater assumes 600 MHz and the frequency stays there.
  Not sure, maybe it stayed on 600 because of next bug or both, still
  the "out_of_sync" is valid and should be handled gracefully:

  Patch [1/2]
  
- userspace governor is using its own cpufreq_policy struct and
  forgets to set max_frequency there in 
  cpufreq_governor_userspace(CPUFREQ_GOV_LIMITS)
  That results in scaling_setspeed staying high in sysfs even the
  frequency has been lowered on _PPC change.
  When _PPC allows all frequencies again, the userspace governor
  uses it's own policy_struct with the old max value again (now the
  low one) and the frequency still stays at lowest frequency.

  Patch [2/2]

I tested with ondemand and userspace governor on a speedstep-centrino
system, both governors had problems with but should work fine with _PPC
changes whether the BIOS prechanges the freq or not.

Could someone please review.

Thanks,

      Thomas
