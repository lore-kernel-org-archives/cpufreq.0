From: Thomas Renninger <trenn@suse.de>
Subject: Re: Speedstep on Celeron SU2300
Date: Thu, 2 Sep 2010 00:40:22 +0200
Message-ID: <201009020040.22388.trenn@suse.de>
References: <AANLkTiktJ5Xgnsmq2je7T3Yc5Sf53Bu8vWMM1XT1V_vm@mail.gmail.com> <AANLkTikhSK8ep1y7y8NJpJamGm0bhpqkWscYEx-era0h@mail.gmail.com> <AANLkTimq+M43QmZsW_FQX7=djANa=WRbqpk0hA6HVoFy@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <AANLkTimq+M43QmZsW_FQX7=djANa=WRbqpk0hA6HVoFy@mail.gmail.com>
Sender: cpufreq-owner@vger.kernel.org
List-ID: <cpufreq.vger.kernel.org>
Content-Type: Text/Plain; charset="us-ascii"
To: Tiago Marques <tiagomnm@gmail.com>
Cc: cpufreq@vger.kernel.org

On Sunday 29 August 2010 06:54:44 Tiago Marques wrote:
> Hi,
> I'm having a problem with this processor not having frequency steps
> and apparently only voltage steps. I find it very strange but that's
> what Intel's documentation suggests. I can't load acpi-cpufreq because
> it doesn't find any device and battery life in linux is suffering
> around 20% less due to this.
Where do you have the 20% info from, I doubt you verified it?

> I have confirmed that the CPU supports
> Speedstep, just this very strange variation.
You are not the only one:
https://bugzilla.kernel.org/show_bug.cgi?id=16072
[HP Pavilion dm1-1110ev] Cpufreq doesn't work at all ( Intel Celeron U2300 )
or the last comments (or search for U2300) here:
http://software.intel.com/en-us/articles/enhanced-intel-speedstepr-technology-and-demand-based-switching-on-linux/

> Can I somehow help with this to get it fixed? Who are the current maintainers?
Not exporting cpu frequencies seem to be intended for this cpu for whatever reasons.
If you have efficient C-states, frequency states are not that important.
You could try msr-tools to access frequency switching MSRs directly.
But you need to know the supported frequencies. Intel generally publishes
such documentation for all of their released CPUs.

You could then try to set the frequency by:
FREQUENCY="max/min_freq_from Intel spec"
modprobe msr
wrmsr --processor X 0x199 $FREQUENCY

This is not a solution, but you could figure out whether switching works
at all and if, you could test whether you really have 20% more of battery life time,
but I expect you won't get that much.

      Thomas
