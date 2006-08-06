From: "Tobias Bocanegra" <tobias.bocanegra@day.com>
Subject: Re: problems setting freq on dual core t2600, 2.6.17-1.2157_FC5smp
Date: Sun, 6 Aug 2006 11:09:45 +0200
Message-ID: <8be731880608060209s7b280ecvadffc9c28c9d770d@mail.gmail.com>
References: <8be731880608030605x6dbeb691kc7079a9d51fe87e9@mail.gmail.com>
	<44D28043.5010301@goop.org>
	<8be731880608051042o6d9a3eb6v2b7290fcd9eaf866@mail.gmail.com>
	<44D59CC5.1010200@goop.org>
Reply-To: tobias.bocanegra@day.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <cpufreq-bounces+glkc-cpufreq=m.gmane.org@lists.linux.org.uk>
In-Reply-To: <44D59CC5.1010200@goop.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeremy Fitzhardinge <jeremy@goop.org>, cpufreq@lists.linux.org.uk

i think it's the perflib:

$ cat /proc/acpi/processor/CPU0/performance
state count:             4
active state:            P1
states:
    P0:                  2167 MHz, 31000 mW, 10 uS
   *P1:                  1667 MHz, 23000 mW, 10 uS
    P2:                  1333 MHz, 18000 mW, 10 uS
    P3:                  1000 MHz, 13000 mW, 10 uS

how is the performance state set / influenced?
regards, toby

On 8/6/06, Jeremy Fitzhardinge <jeremy@goop.org> wrote:
> Tobias Bocanegra wrote:
> > i see the following behaviour when trying to set the 2.17ghz freq:
> >
> > cpufreq-core: setting new policy for CPU 0: 1667000 - 2167000 kHz
> > freq-table: request for verification of policy (1667000 - 2167000 kHz)
> > for cpu 0
> > freq-table: verification lead to (1667000 - 2167000 kHz) for cpu 0
> > freq-table: request for verification of policy (1667000 - 1667000 kHz)
> > for cpu 0
> > freq-table: verification lead to (1667000 - 1667000 kHz) for cpu 0
> > cpufreq-core: new min and max freqs are 1667000 - 1667000 kHz
> > cpufreq-core: governor: change or update limits
> > cpufreq-core: __cpufreq_governor for CPU 0, event 3
> > userspace: limit event for cpu 0: 1667000 - 1667000 kHz,currently
> > 1667000 kHz, last set to 2167000 kHz
> > cpufreq-core: target for CPU 0: 1667000 kHz, relation 1
> > freq-table: request for target 1667000 kHz (relation: 1) for cpu 0
> > freq-table: target is 1 (1667000 kHz, 2592)
> > speedstep-centrino: no change needed - msr was and needs to be a20
> >
> > you can see 2 verifications, the first accepting the new range, the
> > second downgrades the 2.17 to 1.67. as far as i can tell, there are 2
> > listeners that are registered as CPUFREQ_POLICY_NOTIFIER that are
> > relevant:
> >
> > drivers/acpi/processor_perflib.c
> > drivers/acpi/processor_thermal.c
> >
> > the first checks if the freq is within the current power-state, the
> > 2nd, checks if the freq is within the current thermal zone.
> >
> > since i'm not very good at debugging the kernel: how can i turn on the
> > debug messages for those modules? (ps i turned on debug for acpi, but
> > it is not more verbose).
>
> I added some printks in there to see what each driver thought of the
> policy change.  I don't think I got around to testing the results...
>
>     J
>
