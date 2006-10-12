From: Jeremy Fitzhardinge <jeremy@goop.org>
Subject: Strange entries in /proc/acpi/thermal_zone for Thinkpad X60
Date: Thu, 12 Oct 2006 15:19:40 -0700
Message-ID: <452EBF7C.3000409@goop.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=gmane.org@lists.linux.org.uk>
List-Id: <cpufreq.vger.kernel.org>
List-Unsubscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=unsubscribe>
List-Archive: <http://lists.linux.org.uk/mailman/private/cpufreq>
List-Post: <mailto:cpufreq@lists.linux.org.uk>
List-Help: <mailto:cpufreq-request@lists.linux.org.uk?subject=help>
List-Subscribe: <http://lists.linux.org.uk/mailman/listinfo/cpufreq>,
	<mailto:cpufreq-request@lists.linux.org.uk?subject=subscribe>
Sender: cpufreq-bounces@lists.linux.org.uk
Errors-To: cpufreq-bounces+glkc-cpufreq=gmane.org+glkc-cpufreq=gmane.org@lists.linux.org.uk
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Brown, Len" <len.brown@intel.com>, "Pallipadi, Venkatesh" <venkatesh.pallipadi@intel.com>
Cc: cpufreq@lists.linux.org.uk, acpi-devel@kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

I have a Thinkpad X60 with an Intel Core Duo T2400.  In 
/proc/acpi/thermal_zone, I'm getting two subdirectories, each with their 
own set of files:

/proc/acpi/thermal_zone/THM0/cooling_mode:
<setting not supported>
cooling mode:   critical

/proc/acpi/thermal_zone/THM0/polling_frequency:
<polling disabled>

/proc/acpi/thermal_zone/THM0/state:
state:                   ok

/proc/acpi/thermal_zone/THM0/temperature:
temperature:             53 C

/proc/acpi/thermal_zone/THM0/trip_points:
critical (S5):           127 C


/proc/acpi/thermal_zone/THM1/cooling_mode:
<setting not supported>
cooling mode:   passive

/proc/acpi/thermal_zone/THM1/polling_frequency:
<polling disabled>

/proc/acpi/thermal_zone/THM1/state:
state:                   ok

/proc/acpi/thermal_zone/THM1/temperature:
temperature:             53 C

/proc/acpi/thermal_zone/THM1/trip_points:
critical (S5):           97 C
passive:                 93 C: tc1=5 tc2=4 tsp=600 devices=0xf7eaa264 0xf7eaa244 


The interesting thing is that the two sets of files are not consistent - 
sometimes they don't even show the same temperature.

The reason I'm interested in this is that I think it's behind some of my 
cpufreq problems.  Sometimes the kernel decides that I just can't raise 
the max frequency above 1GHz, because its been thermally limited (I've 
put printks in to confirm that its the ACPI thermal limit on the policy 
notifier chain which is limiting the max speed).  It seems to me that 
having a thermal zone for each core is a BIOS bug, since they're really 
the same chip, but the THM1 entries should be ignored.  I don't believe 
the CPU has ever approached either 97 C, let alone 127; while I put it 
under a fair amount of load, it is sitting on a desktop with no airflow 
obstructions, so if it really is overheating it suggests a serious 
design problem with the hardware.

But I'm just speculating; I'm not really sure what all this means.  Any 
clues?

Thanks,
    J
